package com.j4sc.system.server.config;

import com.aliyun.oss.OSSClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/4 16:24
 * @Version: 1.0
 **/
@Configuration
public class AliOssClientConfig {
    @Autowired
    AliOssConfig ossConfig;
    @Bean
    public OSSClient ossClient(){
        OSSClient ossClient = new OSSClient(ossConfig.getEndpoint(),ossConfig.getAccessKeyId(),ossConfig.getAccessKeySecret());
        return ossClient;
    }
}
