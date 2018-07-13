package com.j4sc.system.server.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/4 16:18
 * @Version: 1.0
 **/
@Component
public class QiniuOssConfig {
    @Value("${j4sc.oss.qiniu.AccessKey}")
    private String accessKey;
    @Value("${j4sc.oss.qiniu.SecretKey}")
    private String secretKey;

    public String getAccessKey() {
        return accessKey;
    }

    public void setAccessKey(String accessKey) {
        this.accessKey = accessKey;
    }

    public String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }
}
