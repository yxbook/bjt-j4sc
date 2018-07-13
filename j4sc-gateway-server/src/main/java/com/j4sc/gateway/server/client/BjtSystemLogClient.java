package com.j4sc.gateway.server.client;

import com.j4sc.auth.dao.entity.AuthUser;
import com.j4sc.bjt.system.dao.entity.BjtSystemLog;
import com.j4sc.bjt.user.rest.api.BjtUserApiService;
import com.j4sc.common.base.BaseApiService;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/14 11:47
 * @Version: 1.0
 **/
@FeignClient(value = "bjt-system-server",path = "/BjtSystemLog")
public interface BjtSystemLogClient extends BaseApiService<BjtSystemLog> {
}
