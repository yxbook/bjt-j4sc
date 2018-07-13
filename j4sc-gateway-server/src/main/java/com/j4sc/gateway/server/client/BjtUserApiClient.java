package com.j4sc.gateway.server.client;

import com.j4sc.bjt.user.rest.api.BjtUserApiService;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/14 11:47
 * @Version: 1.0
 **/
@FeignClient(value = "bjt-user-server",path = "/api")
public interface BjtUserApiClient extends BjtUserApiService {
}
