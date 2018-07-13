package com.j4sc.pay.server.controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.baidu.unbiz.fluentvalidator.ComplexResult;
import com.baidu.unbiz.fluentvalidator.FluentValidator;
import com.baidu.unbiz.fluentvalidator.ResultCollectors;
import com.j4sc.common.base.BaseController;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import com.j4sc.common.base.OrderStateEnum;
import com.j4sc.common.validator.NotNullValidator;
import com.j4sc.pay.dao.entity.PayOrder;
import com.j4sc.pay.dao.entity.PayOrderRecord;
import com.j4sc.pay.rest.api.PayOrderRecordService;
import com.j4sc.pay.rest.api.PayOrderService;
import com.j4sc.pay.server.config.AliPayConfig;
import com.j4sc.pay.server.util.AliUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/28 14:38
 * @Version: 1.0
 **/
@RestController
@RequestMapping("auth/ali")
public class AliPayController {

    private final static Logger LOGGER = LoggerFactory.getLogger(AliPayController.class);

    @Autowired
    AlipayClient alipayClient;
    @Autowired
    PayOrderService payOrderService;
    @Autowired
    PayOrderRecordService payOrderRecordService;

    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public BaseResult pay(@RequestParam Map<String,String> params) throws Exception {
        PayOrder payOrder = new PayOrder();
        payOrder.setMoney(BigDecimal.valueOf(Double.parseDouble(params.get("money"))).setScale(2));
        payOrder.setInfo(params.get("info"));
        payOrder.setInfoSelf(params.get("infoSelf"));
        payOrder.setNotifyUrl(params.get("notifyUrl"));
        payOrder.setNotifyJson(params.get("notifyJson"));
        payOrder.setName(params.get("name"));
        payOrder.setUserId(params.get("userId"));
        payOrder.setUsername(params.get("username"));
        //信息校验
        ComplexResult complexResult = FluentValidator.checkAll()
                .on(payOrder.getInfo(), new NotNullValidator("订单内容"))
                .on(params.get("systemId"), new NotNullValidator("系统ID"))
                .on(params.get("type"), new NotNullValidator("订单类型"))
                .on(payOrder.getName(), new NotNullValidator("订单标题"))
                .on(payOrder.getUserId(), new NotNullValidator("用户ID"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!complexResult.isSuccess()) {
            return new BaseResult(BaseResultEnum.ERROR, complexResult.getErrors().get(0).getErrorMsg());
        }
        if (payOrder.getMoney().doubleValue() <= 0){
            return new BaseResult(BaseResultEnum.ERROR, "金额必须大于0！");
        }
        payOrder.setSystemId(Integer.parseInt(params.get("systemId")));
        payOrder.setType(Integer.parseInt(params.get("type")));
        payOrder.setCtime(System.currentTimeMillis());
        payOrder.setState(0);
        payOrder.setChannel("AliPay");
        if (payOrderService.insertAndRecord(payOrder)){
            String res = AliUtil.appPay(alipayClient,payOrder.getMoney().toString(),payOrder.getInfo(),payOrder.getName(),payOrder.getOrderId());
            return new BaseResult(BaseResultEnum.SUCCESS,res);
        }
        return new BaseResult(BaseResultEnum.ERROR,"请求失败");
    }


    @RequestMapping(value = "/notify", method = RequestMethod.POST)
    public String notify(HttpServletRequest request,HttpServletResponse response) throws Exception {
        //获取支付宝POST过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        //切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
        //boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
        boolean flag = AlipaySignature.rsaCheckV1(params, AliPayConfig.ALIPAY_P_PUBLIC_KEY, AliPayConfig.CHARSET,AliPayConfig.SIGN_TYPE);
        if (flag){
            String tradeStatus = params.get("trade_status");
            String out_trade_no = params.get("out_trade_no");
            if(tradeStatus.equals("TRADE_SUCCESS")) {
                //处理支付成功的订单: 修改交易表状态,支付成功
                PayOrder payOrder = payOrderService.selectById(out_trade_no);
                if (null != payOrder){
                    if (payOrderService.updateAndRecordById(payOrder.getOrderId(), OrderStateEnum.SUCCESS)){
                        //回调
                        RestTemplate restTemplate = new RestTemplate();
                        Map<String,Object> notifyBody = new HashMap<>();
                        notifyBody.put("state",1);
                        notifyBody.put("notifyJson",payOrder.getNotifyJson());
                        notifyBody.put("orderId",payOrder.getOrderId());
                        HttpHeaders headers = new HttpHeaders();
                        MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
                        headers.setContentType(type);
                        String requestJson = JSONObject.toJSONString(notifyBody);
                        HttpEntity<String> entity = new HttpEntity<String>(requestJson,headers);
                        String respone = restTemplate.postForObject(payOrder.getNotifyUrl(), entity,String.class);
                        return "success".equals(respone)?"success":"fail";
                    }
                    new BaseResult(BaseResultEnum.SUCCESS,"");
                }
            }else if (tradeStatus.equals("TRADE_FINISHED")){
                //处理交易成功订单  无法退款
            }else if (tradeStatus.equals("WAIT_BUYER_PAY")){
                //处理创建成功订单
            }

        }
        return null;
    }

    /**
     * 统一异常处理
     * @param request
     * @param response
     * @param exception
     */
    @ExceptionHandler
    public Object exceptionHandler(HttpServletRequest request, HttpServletResponse response, Exception exception) {
        LOGGER.error("统一异常处理：", exception);
        request.setAttribute("ex", exception);
        if (null != request.getHeader("X-Requested-With") && "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))) {
            request.setAttribute("requestHeader", "ajax");
        }
        return new BaseResult(BaseResultEnum.ERROR,"请求错误！");
    }
}
