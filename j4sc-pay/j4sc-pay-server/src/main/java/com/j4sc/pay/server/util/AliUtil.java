package com.j4sc.pay.server.util;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.alipay.api.request.AlipayTradeAppPayRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradeAppPayResponse;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/5/11 10:40
 * @Version: 1.0
 **/
public class AliUtil {
    private static String NOTIFY_URL = "http://longrou.free.ngrok.cc/auth/ali/notify";
    //private static String NOTIFY_URL = "http://www.bangjiat.com/pay/auth/ali/notify";


    public static String appPay(AlipayClient alipayClient, String money, String info, String name, String orderId) throws Exception{
        //设置请求参数
        AlipayTradeAppPayRequest request = new AlipayTradeAppPayRequest();
        //SDK已经封装掉了公共参数，这里只需要传入业务参数。以下方法为sdk的model入参方式(model和biz_content同时存在的情况下取biz_content)。
        AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
        model.setBody(info);
        model.setSubject(name);
        model.setOutTradeNo(orderId);
        model.setTimeoutExpress("30m");
        model.setTotalAmount(money);
        model.setProductCode("QUICK_MSECURITY_PAY");
        request.setBizModel(model);
        request.setNotifyUrl(NOTIFY_URL);
        //这里和普通的接口调用不同，使用的是sdkExecute
        AlipayTradeAppPayResponse response = alipayClient.sdkExecute(request);
        return response.getBody();
    }
}
