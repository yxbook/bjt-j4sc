package com.j4sc.auth.common.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * @Description: 授权配置
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/26 15:18
 * @Version: 1.0
 **/
@Component
public class UserAuthConfig {

    @Value("${j4sc.auth.token-header}")
    private String tokenHeader;

    private byte[] pubKeyByte;

    public String getTokenHeader() {
        return tokenHeader;
    }

    public void setTokenHeader(String tokenHeader) {
        this.tokenHeader = tokenHeader;
    }

    public String getToken(HttpServletRequest request){
        return request.getHeader(this.getTokenHeader());
    }

    public byte[] getPubKeyByte() {
        return pubKeyByte;
    }

    public void setPubKeyByte(byte[] pubKeyByte) {
        this.pubKeyByte = pubKeyByte;
    }
}
