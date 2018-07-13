package com.j4sc.system.server.client;

import com.j4sc.common.base.BaseResult;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 17:50
 * @Version: 1.0
 **/
@FeignClient(value = "j4sc-auth-server",path = "/key")
public interface AuthKeyClient {
    @RequestMapping(value = "/userPubKey",method = RequestMethod.GET)
    BaseResult getUserPublicKey();
}
