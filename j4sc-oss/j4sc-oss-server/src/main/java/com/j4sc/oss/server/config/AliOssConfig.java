package com.j4sc.oss.server.config;

import com.j4sc.common.util.AESUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/4 16:18
 * @Version: 1.0
 **/
@Component
public class AliOssConfig {
    @Value("${j4sc.oss.ali.endpoint}")
    private String endpoint;
    @Value("${j4sc.oss.ali.access_key_id}")
    private String accessKeyId;
    @Value("${j4sc.oss.ali.access_key_secret}")
    private String accessKeySecret;

    public String getEndpoint() {
        return endpoint;
    }

    public void setEndpoint(String endpoint) {
        this.endpoint = endpoint;
    }

    public String getAccessKeyId() {
        return AESUtil.aesDecode(accessKeyId);
    }

    public void setAccessKeyId(String accessKeyId) {
        this.accessKeyId = accessKeyId;
    }

    public String getAccessKeySecret() {
        return AESUtil.aesDecode(accessKeySecret);
    }

    public void setAccessKeySecret(String accessKeySecret) {
        this.accessKeySecret = accessKeySecret;
    }
}
