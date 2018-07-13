package com.j4sc.auth.server.rest.service.impl;

import com.j4sc.auth.rest.api.AuthKeyService;
import com.j4sc.auth.server.config.RsaConfig;
import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/29 15:25
 * @Version: 1.0
 **/
@Service
@Transactional
@BaseService
@RequestMapping("key")
@RestController
@ApiIgnore
public class AuthKeyServiceImpl implements AuthKeyService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthKeyServiceImpl.class);
    private static final String REDIS_USER_PUB_KEY = "J4SC:AUTH:JWT:PUB";
    @Autowired
    private RedisTemplate<String, String> redisTemplate;
    @Autowired
    private RsaConfig rsaConfig;

    @Override
    public BaseResult getUserPublicKey() {
        if (redisTemplate.hasKey(REDIS_USER_PUB_KEY)){
            return new BaseResult(BaseResultEnum.SUCCESS,redisTemplate.opsForValue().get(REDIS_USER_PUB_KEY));
        }
        return new BaseResult(BaseResultEnum.ERROR,"密钥不存在");
    }
}
