package com.j4sc.auth.server.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.j4sc.auth.dao.entity.AuthUser;
import com.j4sc.auth.rest.api.AuthApiService;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import io.swagger.annotations.*;
import io.swagger.models.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description: 用户JWT授权服务
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 13:37
 * @Version: 1.0
 **/
@RestController
@RequestMapping("auth")
@Api(tags = {"授权管理"}, description = "JWT授权管理")
public class AuthController {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthController.class);
    @Autowired
    AuthApiService authApiService;

    //登录。获取token
    @ApiOperation(value = "管理用户登录",notes = "登录之后获取token，根据项目约定使用")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", value = "用户名", required = true, dataType = "String"),
            @ApiImplicitParam(name = "password", value = "用户密码", required = true, dataType = "String")
    })
    @RequestMapping(value = "login", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult createAuthenticationToken(@RequestBody AuthUser authUser){
        LOGGER.info(authUser.getUsername()+" 登录...");
        String token;
        try {
            token = authApiService.login(authUser);
        }catch (Exception e){
            //e.printStackTrace();
            return new BaseResult(BaseResultEnum.ERROR, e.getMessage());
        }
        Map<String,String> map  = new HashMap<String,String>();
        map.put("token",token);
        return new BaseResult(BaseResultEnum.SUCCESS, map);
    }

}
