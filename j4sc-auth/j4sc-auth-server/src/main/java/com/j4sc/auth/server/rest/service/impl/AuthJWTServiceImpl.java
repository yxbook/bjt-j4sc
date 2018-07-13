package com.j4sc.auth.server.rest.service.impl;

import com.j4sc.auth.common.jwt.JwtInfo;
import com.j4sc.auth.dao.entity.AuthLog;
import com.j4sc.auth.rest.api.AuthJWTService;
import com.j4sc.auth.server.util.JwtTokenUtil;
import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/31 11:09
 * @Version: 1.0
 **/
@Service
@Transactional
@BaseService
@RequestMapping("jwt")
@RestController
@ApiIgnore
public class AuthJWTServiceImpl implements AuthJWTService{

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthJWTServiceImpl.class);

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    public BaseResult getToken(String userName, String nickName, String userId) {
        String token = "";
        try {
            token = jwtTokenUtil.generateToken(new JwtInfo(userName,userId,nickName));
        }catch (Exception e){
            return new BaseResult(BaseResultEnum.ERROR, e.getMessage());
        }
        return new BaseResult(BaseResultEnum.SUCCESS, token);
    }

    @Override
    public BaseResult saveOrUpdateUser(@RequestBody AuthLog authLog) {
        System.out.println("saveOrUpdateUser = >"+authLog);
        return new BaseResult(BaseResultEnum.SUCCESS, authLog);
    }
}
