package com.j4sc.gateway.server.runner;

import com.j4sc.auth.common.config.UserAuthConfig;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.util.RsaUtil;
import com.j4sc.gateway.server.client.AuthKeyClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.http.HttpStatus;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @Description: 注入秘钥任务
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 16:38
 * @Version: 1.0
 **/
@Component
@EnableScheduling
public class AuthKeyRunner implements CommandLineRunner{
    
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthKeyRunner.class);
    
    //@Autowired
    //private ServiceAuthConfig serviceAuthConfig;
    @Autowired
    private UserAuthConfig userAuthConfig;
    @Autowired
    private AuthKeyClient authKeyClient;

    @Override
    public void run(String... args) throws Exception {
        LOGGER.info("初始化加载用户pubKey");
        try {
            refreshUserPubKey();
        }catch(Exception e){
            LOGGER.error("初始化加载用户pubKey失败,1分钟后自动重试!",e);
        }
//        LOGGER.info("初始化加载客户pubKey");
//        try {
//            refreshServicePubKey();
//        }catch(Exception e){
//            LOGGER.error("初始化加载客户pubKey失败,1分钟后自动重试!",e);
//        }
    }
    @Scheduled(cron = "0 0/1 * * * ?")
    public void refreshUserPubKey() throws Exception{
        BaseResult result = authKeyClient.getUserPublicKey();
        if (result.getStatus() == HttpStatus.OK.value()) {
            this.userAuthConfig.setPubKeyByte(RsaUtil.toBytes((String) result.getData()));
        }
    }
//    @Scheduled(cron = "0 0/1 * * * ?")
//    public void refreshServicePubKey(){
//        BaseResponse resp = serviceAuthFeign.getServicePublicKey(serviceAuthConfig.getClientId(), serviceAuthConfig.getClientSecret());
//        if (resp.getStatus() == HttpStatus.OK.value()) {
//            ObjectRestResponse<byte[]> userResponse = (ObjectRestResponse<byte[]>) resp;
//            this.serviceAuthConfig.setPubKeyByte(userResponse.getData());
//        }
//    }
}
