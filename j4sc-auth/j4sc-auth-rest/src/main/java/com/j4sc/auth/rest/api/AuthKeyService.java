package com.j4sc.auth.rest.api;

import com.j4sc.common.base.BaseResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Description: 授权密钥服务
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 17:02
 * @Version: 1.0
 **/
public interface AuthKeyService {
    @RequestMapping(value = "/userPubKey",method = RequestMethod.GET)
    BaseResult getUserPublicKey();
}
