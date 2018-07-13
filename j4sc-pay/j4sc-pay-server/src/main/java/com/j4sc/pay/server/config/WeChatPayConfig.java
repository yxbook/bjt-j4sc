package com.j4sc.pay.server.config;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/5/10 17:55
 * @Version: 1.0
 **/
public class WeChatPayConfig {
    public static String APP_ID = "wx432ba0b2e3addde9";
    public static String MCH_ID = "1493210522";
    public static String KEY = "2ddC3wbLIwBSf0G2Ry4xSV96ZUVphB8r";
    public static String PAY_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";

}
