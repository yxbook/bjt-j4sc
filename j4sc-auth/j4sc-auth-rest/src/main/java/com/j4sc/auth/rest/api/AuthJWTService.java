package com.j4sc.auth.rest.api;

import com.j4sc.auth.dao.entity.AuthLog;
import com.j4sc.auth.dao.entity.AuthUser;
import com.j4sc.common.base.BaseResult;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Description: 为其他服务提供鉴权令牌的服务
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/31 11:05
 * @Version: 1.0
 **/
public interface AuthJWTService {
    /**
     * 生成token
     *
     * @param userName
     * @return
     */
    @RequestMapping(value = "/getToken", method = RequestMethod.GET)
    BaseResult getToken(@RequestParam("userName") String userName,
                        @RequestParam("nickName") String nickName,
                        @RequestParam("userId") String userId);

    @RequestMapping(
            value = "/saveOrUpdateUser",
            method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE
    )
    BaseResult saveOrUpdateUser(@RequestBody AuthLog authLog);
}
