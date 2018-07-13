package com.j4sc.auth.server.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.j4sc.auth.dao.entity.AuthPermission;
import com.j4sc.auth.dao.entity.AuthUser;
import com.j4sc.auth.rest.api.AuthApiService;
import com.j4sc.auth.rest.api.AuthPermissionService;
import com.j4sc.auth.rest.api.AuthUserService;
import com.j4sc.auth.server.base.BaseJwtController;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/3 13:41
 * @Version: 1.0
 **/
@RestController
@RequestMapping("upms")
@Api(tags = {"Admin管理"}, description = "Admin管理")
public class AuthAdminController extends BaseJwtController {
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthAdminController.class);
    @Autowired
    AuthApiService authApiService;
    @Autowired
    AuthPermissionService authPermissionService;
    @Autowired
    AuthUserService authUserService;

    @ApiOperation(value = "获取权限",notes = "获取权限，建立菜单使用")
    @ApiImplicitParams({
    })
    @RequestMapping(value = "getPermission", method = RequestMethod.GET)
    public BaseResult getPermission(){
        LOGGER.info(getUserId()+" 获取权限列表...");
        List<AuthPermission> list = authApiService.selectAuthPermissionByAuthUserId(getUserId());
        return new BaseResult(BaseResultEnum.SUCCESS, list);
    }
    @ApiOperation(value = "获取用户信息",notes = "获取用户信息")
    @ApiImplicitParams({
    })
    @RequestMapping(value = "getUserInfo", method = RequestMethod.GET)
    public BaseResult getUserInfo(){
        LOGGER.info(getUserId()+" 获取用户信息...");
        AuthUser authUser = authUserService.selectById(getUserId());
        return new BaseResult(BaseResultEnum.SUCCESS, authUser);
    }
    /*
    * 权限
    *
    *
    * */
    @ApiOperation(value = "获取所有权限",notes = "获取所有权限")
    @ApiImplicitParams({
    })
    @RequestMapping(value = "getAllPermission", method = RequestMethod.GET)
    public BaseResult getAllPermission(){
        LOGGER.info(getUserId()+" 获取所有权限列表...");
        List<AuthPermission> list = authApiService.getAllPermission();
        return new BaseResult(BaseResultEnum.SUCCESS, list);
    }
}
