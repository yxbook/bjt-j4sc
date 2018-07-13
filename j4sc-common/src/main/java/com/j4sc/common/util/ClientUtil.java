package com.j4sc.common.util;

import javax.servlet.http.HttpServletRequest;

/**
 * @Description: 客户端工具
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/26 16:33
 * @Version: 1.0
 **/
public class ClientUtil {
    /**
     * 获取客户端真实ip
     * @param request
     * @return
     */
    public static String getClientIp(HttpServletRequest request){
        String ip = request.getHeader("x-forwarded-for");
        if (ip==null||ip.length()==0||"unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip==null||ip.length()==0||"unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip==null||ip.length()==0||"unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
