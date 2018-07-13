package com.j4sc.system.server.config;

import com.qiniu.common.Zone;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
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
public class QiniuOssClientConfig {
    @Autowired
    QiniuOssConfig ossConfig;

    @Bean
    public UploadManager uploadManager() {
        //构造一个带指定Zone对象的配置类
        com.qiniu.storage.Configuration cfg = new com.qiniu.storage.Configuration(Zone.zone2());
        //...其他参数参考类注释
        UploadManager uploadManager = new UploadManager(cfg);


        return uploadManager;
    }
    @Bean
    public Auth auth() {
        Auth auth = Auth.create(ossConfig.getAccessKey(), ossConfig.getSecretKey());
        return auth;
    }
}
