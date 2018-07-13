package com.j4sc.gateway.server.client;

import com.j4sc.auth.rest.api.AuthKeyService;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 17:50
 * @Version: 1.0
 **/
@FeignClient(value = "j4sc-auth-server",path = "/key")
public interface AuthKeyClient extends AuthKeyService{
}
