package com.j4sc.pay.server.controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayClient;
import com.baidu.unbiz.fluentvalidator.ComplexResult;
import com.baidu.unbiz.fluentvalidator.FluentValidator;
import com.baidu.unbiz.fluentvalidator.ResultCollectors;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import com.j4sc.common.base.OrderStateEnum;
import com.j4sc.common.util.RequestUtil;
import com.j4sc.common.util.XmlUtil;
import com.j4sc.common.validator.NotNullValidator;
import com.j4sc.pay.dao.entity.PayOrder;
import com.j4sc.pay.rest.api.PayOrderRecordService;
import com.j4sc.pay.rest.api.PayOrderService;
import com.j4sc.pay.server.config.WeChatPayConfig;
import com.j4sc.pay.server.util.AliUtil;
import com.j4sc.pay.server.util.WeChatUtil;
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
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.*;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/28 14:38
 * @Version: 1.0
 **/
@RestController
@RequestMapping("auth/wechat")
public class WeChatPayController {

    private final static Logger LOGGER = LoggerFactory.getLogger(WeChatPayController.class);

    @Autowired
    PayOrderService payOrderService;
    @Autowired
    PayOrderRecordService payOrderRecordService;

    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public BaseResult pay(HttpServletRequest request,@RequestParam Map<String,String> params) throws Exception {
        System.out.println(params);
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
        payOrder.setChannel("WeChatPay");
        if (payOrderService.insertAndRecord(payOrder)){
            String res = WeChatUtil.appPay(RequestUtil.getClientIpAddr(request),payOrder.getMoney().multiply(new BigDecimal("100")).setScale(0).toString(),payOrder.getInfo(),payOrder.getName(),payOrder.getOrderId());
            System.out.println(res);
            return new BaseResult(BaseResultEnum.SUCCESS,res);
        }
        return new BaseResult(BaseResultEnum.ERROR,"请求失败");
    }


    @RequestMapping(value = "/notify", method = RequestMethod.POST)
    public String notify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        LOGGER.info("微信回调：");
        //读取参数
        InputStream inputStream ;
        StringBuffer sb = new StringBuffer();
        inputStream = request.getInputStream();
        String s ;
        BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        while ((s = in.readLine()) != null){
            sb.append(s);
        }
        in.close();
        inputStream.close();

        //解析xml成map
        Map<String, String> m = XmlUtil.dom4jXMLParse(sb.toString());
        //过滤空 设置 TreeMap
        SortedMap<String,String> packageParams = new TreeMap<String,String>();
        Iterator it = m.keySet().iterator();
        while (it.hasNext()) {
            String parameter = (String) it.next();
            String parameterValue = m.get(parameter);

            String v = "";
            if(null != parameterValue) {
                v = parameterValue.trim();
            }
            packageParams.put(parameter, v);
        }
        //判断签名是否正确
        if(WeChatUtil.isWechatSign(packageParams, WeChatPayConfig.KEY)) {
            //------------------------------
            //处理业务开始
            //------------------------------
            String resXml = "";
            if("SUCCESS".equals((String)packageParams.get("result_code"))){
                // 这里是支付成功
                //////////执行自己的业务逻辑////////////////
                String mch_id = (String)packageParams.get("mch_id");
                String openid = (String)packageParams.get("openid");
                String is_subscribe = (String)packageParams.get("is_subscribe");
                String out_trade_no = (String)packageParams.get("out_trade_no");

                String total_fee = (String)packageParams.get("total_fee");
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
                        if ("success".equals(respone)){
                            //通知微信.异步确认成功.必写.不然会一直通知后台.八次之后就认为交易失败了.
                            resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
                                    + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
                        }
                    }else {
                        resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                                + "<return_msg><![CDATA[本地错误]]></return_msg>" + "</xml> ";
                    }
                }
            } else {
                LOGGER.info("支付失败,错误信息：" + packageParams.get("err_code"));
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
            }
            //------------------------------
            //处理业务完毕
            //------------------------------
            return resXml;
        } else{
            LOGGER.info("通知签名验证失败");
        }
        return "FAIL";
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
