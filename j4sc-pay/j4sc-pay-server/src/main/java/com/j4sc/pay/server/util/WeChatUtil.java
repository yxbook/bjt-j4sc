package com.j4sc.pay.server.util;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.alipay.api.request.AlipayTradeAppPayRequest;
import com.alipay.api.response.AlipayTradeAppPayResponse;
import com.j4sc.common.util.MD5Util;
import com.j4sc.common.util.RandomUtil;
import com.j4sc.common.util.XmlUtil;
import com.j4sc.pay.server.config.WeChatPayConfig;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/5/11 10:40
 * @Version: 1.0
 **/
public class WeChatUtil {
    private static String NOTIFY_URL = "http://longrou.free.ngrok.cc/auth/wechat/notify";
    //private static String NOTIFY_URL = "http://www.bangjiat.com/pay/auth/wechat/notify";

    /**
     * 创建微信交易对象
     */
    public static SortedMap<Object, Object> getWXPrePayID()
    {
        SortedMap<Object, Object> parameters = new TreeMap<Object, Object>();
        parameters.put("appid", WeChatPayConfig.APP_ID);
        parameters.put("mch_id", WeChatPayConfig.MCH_ID);
        parameters.put("nonce_str", RandomUtil.generateString(32));
        parameters.put("fee_type", "CNY");
        parameters.put("notify_url", NOTIFY_URL);
        parameters.put("trade_type", "APP");
        return parameters;
    }
    /**
     * @Description：创建sign签名
     * @param parameters
     *            请求参数
     * @return
     */
    public static String createSign(SortedMap<Object, Object> parameters)
    {
        StringBuffer sb = new StringBuffer();
        Set es = parameters.entrySet();
        Iterator it = es.iterator();
        while (it.hasNext())
        {
            Map.Entry entry = (Map.Entry) it.next();
            String k = (String) entry.getKey();
            Object v = entry.getValue();
            if (null != v && !"".equals(v) && !"sign".equals(k) && !"key".equals(k))
            {
                sb.append(k + "=" + v + "&");
            }
        }
        sb.append("key=" + WeChatPayConfig.KEY);
        String sign;
//        try {
//            sign = MD5Util.md5(URLEncoder.encode(sb.toString(),"utf-8")).toUpperCase();
//
//        }catch (Exception e){
//
//        }
        sign = MD5Util.md5(sb.toString()).toUpperCase();
        return sign;
    }
    /**
     * @Description：将请求参数转换为xml格式的string
     * @param parameters
     *            请求参数
     * @return
     */
    public static String getRequestXml(SortedMap<Object, Object> parameters)
    {
        StringBuffer sb = new StringBuffer();
        sb.append("<xml>");
        Set es = parameters.entrySet();
        Iterator it = es.iterator();
        while (it.hasNext())
        {
            Map.Entry entry = (Map.Entry) it.next();
            String k = (String) entry.getKey();
            String v = (String) entry.getValue();
            if ("attach".equalsIgnoreCase(k) || "body".equalsIgnoreCase(k))
            {
                sb.append("<" + k + ">" + "<![CDATA[" + v + "]]></" + k + ">");
            } else
            {
                sb.append("<" + k + ">" + v + "</" + k + ">");
            }
        }
        sb.append("</xml>");
        return sb.toString();
    }
    public static boolean isWechatSign(SortedMap<String, String> smap,String apiKey) {
        StringBuffer sb = new StringBuffer();
        Set es = smap.entrySet();
        Iterator it = es.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String k = (String) entry.getKey();
            String v = (String) entry.getValue();
            if (!"sign".equals(k) && null != v && !"".equals(v) && !"key".equals(k)) {
                sb.append(k + "=" + v + "&");
            }
        }
        sb.append("key=" + apiKey);
        /** 验证的签名 */
        String sign = MD5Util.md5(sb.toString()).toUpperCase();
        /** 微信端返回的合法签名 */
        String validSign = ((String) smap.get("sign")).toUpperCase();
        return validSign.equals(sign);
    }
    public static String appPay(String userIp, String money, String info, String name, String orderId) throws Exception{
        SortedMap<Object, Object> parameters = getWXPrePayID();
        parameters.put("body", info);
        parameters.put("spbill_create_ip", userIp);
        parameters.put("out_trade_no", orderId);
        parameters.put("total_fee", money);
        // 设置签名
        String sign = createSign(parameters);
        parameters.put("sign", sign);
        // 封装请求参数结束
        // 获取xml结果
        String requestXML = getRequestXml(parameters);
        requestXML = new String(requestXML.getBytes("UTF-8"), "ISO-8859-1");
        RestTemplate restTemplate = new RestTemplate();
        // 调用统一下单接口
        String result = restTemplate.postForObject(WeChatPayConfig.PAY_URL,requestXML,String.class);
        result = new String(result.getBytes("ISO-8859-1"), "utf-8");
        Map map = XmlUtil.xml2Map(result);
        //预付商品id
        String prepay_id = (String) map.get("/xml/prepay_id");
        //这里要对参数进行二次签名
        SortedMap<Object, Object> secParaMap = new TreeMap<Object,Object>();
        secParaMap.put("appid", WeChatPayConfig.APP_ID);
        secParaMap.put("partnerid",WeChatPayConfig.MCH_ID);
        secParaMap.put("prepayid", prepay_id);
        //这里不确定是不是要重新生成一个随机串，再改
        secParaMap.put("noncestr", parameters.get("nonce_str"));
        secParaMap.put("timestamp", Long.toString(System.currentTimeMillis()/1000));
        secParaMap.put("package", "Sign=WXPay");
        String secSign = createSign(secParaMap);
        secParaMap.put("sign", secSign);
        secParaMap.put("prepayid", prepay_id);
        return JSONObject.toJSONString(secParaMap);
    }

}
