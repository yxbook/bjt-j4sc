package com.j4sc.auth.server.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.sql.*;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 14:04
 * @Version: 1.0
 **/
@Component
public class RsaConfig {
    @Value("${jwt.rsa-secret}")
    private String userSecret;
    //@Value("${client.rsa-secret}")
    //private String serviceSecret;
    private byte[] userPubKey;
    private byte[] userPriKey;
    private byte[] servicePriKey;
    private byte[] servicePubKey;

    public String getUserSecret() {
        return userSecret;
    }

    public void setUserSecret(String userSecret) {
        this.userSecret = userSecret;
    }

    public byte[] getUserPubKey() {
        return userPubKey;
    }

    public void setUserPubKey(byte[] userPubKey) {
        this.userPubKey = userPubKey;
    }

    public byte[] getUserPriKey() {
        return userPriKey;
    }

    public void setUserPriKey(byte[] userPriKey) {
        this.userPriKey = userPriKey;
    }

    public byte[] getServicePriKey() {
        return servicePriKey;
    }

    public void setServicePriKey(byte[] servicePriKey) {
        this.servicePriKey = servicePriKey;
    }

    public byte[] getServicePubKey() {
        return servicePubKey;
    }

    public void setServicePubKey(byte[] servicePubKey) {
        this.servicePubKey = servicePubKey;
    }

}
