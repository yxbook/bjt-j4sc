package com.j4sc.auth.server.runner;

import com.j4sc.auth.server.config.RsaConfig;
import com.j4sc.common.util.RsaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 14:56
 * @Version: 1.0
 **/
@Component
public class AuthServerRunner implements CommandLineRunner{
    private static final String REDIS_USER_PRI_KEY = "J4SC:AUTH:JWT:PRI";
    private static final String REDIS_USER_PUB_KEY = "J4SC:AUTH:JWT:PUB";
    private static final String REDIS_SERVICE_PRI_KEY = "J4SC:AUTH:CLIENT:PRI";
    private static final String REDIS_SERVICE_PUB_KEY = "J4SC:AUTH:CLIENT:PUB";
    @Autowired
    private RsaConfig rsaConfig;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;
    @Override
    public void run(String... args) throws Exception {
        if (redisTemplate.hasKey(REDIS_USER_PRI_KEY)&&redisTemplate.hasKey(REDIS_USER_PUB_KEY)&&redisTemplate.hasKey(REDIS_SERVICE_PRI_KEY)&&redisTemplate.hasKey(REDIS_SERVICE_PUB_KEY)) {
            rsaConfig.setUserPriKey(RsaUtil.toBytes(redisTemplate.opsForValue().get(REDIS_USER_PRI_KEY).toString()));
            rsaConfig.setUserPubKey(RsaUtil.toBytes(redisTemplate.opsForValue().get(REDIS_USER_PUB_KEY).toString()));
            //rsaConfig.setServicePriKey(RsaUtil.toBytes(redisTemplate.opsForValue().get(REDIS_SERVICE_PRI_KEY).toString()));
            //rsaConfig.setServicePubKey(RsaUtil.toBytes(redisTemplate.opsForValue().get(REDIS_SERVICE_PUB_KEY).toString()));
        } else {
            Map<String, byte[]> keyMap = RsaUtil.generateKey(rsaConfig.getUserSecret());
            rsaConfig.setUserPriKey(keyMap.get("pri"));
            rsaConfig.setUserPubKey(keyMap.get("pub"));
            redisTemplate.opsForValue().set(REDIS_USER_PRI_KEY, RsaUtil.toHexString(keyMap.get("pri")));
            redisTemplate.opsForValue().set(REDIS_USER_PUB_KEY, RsaUtil.toHexString(keyMap.get("pub")));
//            keyMap = RsaUtil.generateKey(rsaConfig.getServiceSecret());
//            rsaConfig.setServicePriKey(keyMap.get("pri"));
//            rsaConfig.setServicePubKey(keyMap.get("pub"));
//            redisTemplate.opsForValue().set(REDIS_SERVICE_PRI_KEY, RsaUtil.toHexString(keyMap.get("pri")));
//            redisTemplate.opsForValue().set(REDIS_SERVICE_PUB_KEY, RsaUtil.toHexString(keyMap.get("pub")));

        }
    }
}
