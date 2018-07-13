package com.j4sc.auth.server.controller;

import com.baidu.unbiz.fluentvalidator.ComplexResult;
import com.baidu.unbiz.fluentvalidator.FluentValidator;
import com.baidu.unbiz.fluentvalidator.ResultCollectors;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.j4sc.auth.dao.entity.AuthPermission;
import com.j4sc.auth.dao.entity.AuthUser;
import com.j4sc.auth.dao.entity.AuthUserPermission;
import com.j4sc.auth.rest.api.AuthApiService;
import com.j4sc.auth.rest.api.AuthUserPermissionService;
import com.j4sc.auth.rest.api.AuthUserRoleService;
import com.j4sc.auth.rest.api.AuthUserService;
import com.j4sc.common.base.BaseApiService;
import com.j4sc.common.base.BaseController;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import com.j4sc.common.util.AESUtil;
import com.j4sc.common.util.MD5Util;
import com.j4sc.common.validator.LengthValidator;
import com.j4sc.common.validator.NotNullValidator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/12 9:55
 * @Version: 1.0
 **/
@RestController
@RequestMapping("user")
@Api(tags = {"系统用户管理"}, description = "系统用户管理")
public class AuthUserController extends BaseController<AuthUser,AuthUserService> implements BaseApiService<AuthUser> {
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthUserController.class);

    @Autowired
    private AuthUserPermissionService authUserPermissionService;
    @Autowired
    private AuthUserRoleService authUserRoleService;
    @Autowired
    private AuthApiService authApiService;


    @Override
    @ApiOperation(value = "新增用户信息",notes = "新增用户信息")
    @RequestMapping(value = "add/User", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult insert(@RequestBody AuthUser entity) {
        //信息校验
        ComplexResult result = FluentValidator.checkAll()
                .on(entity.getUsername(), new LengthValidator(1, 20, "帐号"))
                .on(entity.getPassword(), new LengthValidator(5, 32, "密码"))
                .on(entity.getRealname(), new NotNullValidator("姓名"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new BaseResult(BaseResultEnum.ERROR, result.getErrors().get(0).getErrorMsg());
        }
        String salt = UUID.randomUUID().toString().replaceAll("-", "");
        entity.setSalt(salt);
        entity.setPassword(MD5Util.md5(entity.getPassword() + entity.getSalt()));
        entity.setCtime(System.currentTimeMillis());
        AuthUser authUser = service.selectOne(new EntityWrapper<AuthUser>().eq("username",entity.getUsername()));
        if (null != authUser){return new BaseResult(BaseResultEnum.ERROR, "账号已存在");}
        return super.insert(entity);
    }

    @Override
    @ApiOperation(value = "根据ID删除用户信息",notes = "根据ID删除用户信息")
    @RequestMapping(value = "delete/User", method = RequestMethod.DELETE ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult deleteById(String id) {
        return new BaseResult(BaseResultEnum.ERROR,"暂停删除");
        //return super.deleteById(id);
    }

    @ApiOperation(value = "用户修改密码", notes = "用户修改密码")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "用户编号", required = true),
            @ApiImplicitParam(name = "newPassword", value = "新密码", required = true),
            @ApiImplicitParam(name = "oldPassword", value = "原密码", required = true)
    })
    @RequestMapping(value = "update/Password", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult updatePassword(@RequestBody Map<String, Object> params) {
        AuthUser user = service.selectOne(new EntityWrapper<AuthUser>().eq("user_id", params.get("userId")));

        if (user == null) {
            return new BaseResult(BaseResultEnum.ERROR, "当前用户为空！");
        }
        if (!user.getPassword().equals(MD5Util.md5(params.get("oldPassword") + user.getSalt()))) {
            return new BaseResult(BaseResultEnum.ERROR, "原密码输入错误！");
        }
        user.setPassword(MD5Util.md5(params.get("newPassword") + user.getSalt()));

        boolean result = service.update(user, new EntityWrapper<AuthUser>().eq("user_id", params.get("userId")));

        return result ? new BaseResult(BaseResultEnum.SUCCESS, "密码修改成功！") : new BaseResult(BaseResultEnum.ERROR, "密码修改失败！");
    }
    @Override
    @ApiOperation(value = "根据ID修改用户信息",notes = "根据ID修改用户信息")
    @RequestMapping(value = "update/User", method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult updateById(@RequestBody AuthUser entity) {
        //信息校验
        ComplexResult result = FluentValidator.checkAll()
                .on(entity.getUsername(), new LengthValidator(1, 20, "帐号"))
                .on(entity.getPassword(), new LengthValidator(5, 32, "密码"))
                .on(entity.getRealname(), new NotNullValidator("真实姓名"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new BaseResult(BaseResultEnum.ERROR, result.getErrors().get(0).getErrorMsg());
        }
        AuthUser authUser = service.selectOne(new EntityWrapper<AuthUser>().eq("username",entity.getUsername()));
        if (null == authUser){return new BaseResult(BaseResultEnum.ERROR, "错误的请求");}
        if (authUser.getUserId().equals(entity.getUserId())){return new BaseResult(BaseResultEnum.ERROR, "错误的请求");}
        if (!entity.getPassword().equals(authUser.getPassword())){entity.setPassword(MD5Util.md5(entity.getPassword() + entity.getSalt()));}
        return super.updateById(entity);
    }

    @Override
    @ApiOperation(value = "根据ID查询用户信息",notes = "根据ID查询用户信息")
    @RequestMapping(value = "select/User", method = RequestMethod.GET)
    public BaseResult<AuthUser> selectById(String id) {
        return super.selectById(id);
    }

    @Override
    @ApiOperation(value = "查询用户信息分页",notes = "查询用户信息分页")
    @RequestMapping(value = "select/PageUser", method = RequestMethod.GET)
    public BaseResult<Page<AuthUser>> selectPage(@RequestParam Map<String, Object> params) {
        return super.selectPage(params);
    }

    @ApiOperation(value = "查询所有用户信息",notes = "查询所有用户信息")
    @RequestMapping(value = "select/AllUser", method = RequestMethod.GET)
    @Override
    public BaseResult<List<AuthUser>> selectAll(@RequestParam Map<String, Object> params) {
        return super.selectAll(params);
    }

    @ApiOperation(value = "根据用户id获取所拥有的权限",notes = "根据用户id获取所拥有的权限")
    @RequestMapping(value = "select/getPermissionByUserId", method = RequestMethod.GET)
    public BaseResult<List<AuthPermission>> selectAuthUserPermisstionByAuthUserId(@RequestParam("id") String id) {
        List<AuthPermission> list = authApiService.selectAuthPermissionByAuthUserId(id);
        return new BaseResult(BaseResultEnum.SUCCESS,list);
    }
    @ApiOperation(value = "根据用户id获取所拥有的权限，不包括角色含有的",notes = "根据用户id获取所拥有的权限，不包括角色含有的")
    @RequestMapping(value = "select/getPermissionByUserIdWithOutRole", method = RequestMethod.GET)
    public BaseResult<List<AuthUserPermission>> getPermissionByUserIdWithOutRole(@RequestParam("id") String id) {
        List<AuthUserPermission> list = authUserPermissionService.selectList(new EntityWrapper<AuthUserPermission>().eq("user_id",id));
        return new BaseResult(BaseResultEnum.SUCCESS,list);
    }

    @ApiOperation(value = "为用户添加权限",notes = "为用户添加权限")
    @RequestMapping(value = "add/addPermissionByUserId", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult insertPermissionByUserId(@RequestBody Map<String, Object> params) {
//        LOGGER.error(params.toString());
//        AuthUser authUser = service.selectById((Integer)params.get("rodeId"));
//        if (null == authUser)return new BaseResult(BaseResultEnum.ERROR,"用户不存在！");
//        List<Integer> list = (List<Integer>) params.get("list");
//        LOGGER.error(list.toString());
//        if (authUserPermissionService.replacePermissionByUserId(authUser.getUserId(),list))return new BaseResult(BaseResultEnum.SUCCESS,"保存成功");
        return new BaseResult(BaseResultEnum.ERROR,"更新权限失败");
    }
    @ApiOperation(value = "为用户添加角色",notes = "为用户添加角色")
    @RequestMapping(value = "add/addRoleByUserId", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult addRoleByUserId(@RequestBody Map<String, Object> params) {
        LOGGER.error(params.toString());
        AuthUser authUser = service.selectById((Serializable) params.get("userId"));
        if (null == authUser){return new BaseResult(BaseResultEnum.ERROR,"用户不存在！");}
        List<Integer> list = (List<Integer>) params.get("list");
        LOGGER.error(list.toString());
        if (authUserRoleService.replaceRoleByRoleId(authUser.getUserId(),list)){return new BaseResult(BaseResultEnum.SUCCESS,"保存成功");}
        return new BaseResult(BaseResultEnum.ERROR,"更新用户角色失败");
    }
}
