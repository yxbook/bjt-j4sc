package com.j4sc.auth.server.controller;

import com.alibaba.fastjson.JSONObject;
import com.baidu.unbiz.fluentvalidator.ComplexResult;
import com.baidu.unbiz.fluentvalidator.FluentValidator;
import com.baidu.unbiz.fluentvalidator.ResultCollectors;
import com.baomidou.mybatisplus.plugins.Page;
import com.j4sc.auth.dao.entity.AuthPermission;
import com.j4sc.auth.rest.api.AuthPermissionService;
import com.j4sc.common.base.BaseApiService;
import com.j4sc.common.base.BaseController;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import com.j4sc.common.util.MapUtil;
import com.j4sc.common.validator.LengthValidator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cglib.beans.BeanMap;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/10 10:51
 * @Version: 1.0
 **/
@RestController
@RequestMapping("permission")
@Api(tags = {"系统权限管理"}, description = "系统权限管理")
public class AuthPermissionController extends BaseController<AuthPermission,AuthPermissionService> implements BaseApiService<AuthPermission> {
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthPermissionController.class);

    @Override
    @ApiOperation(value = "新增权限信息",notes = "新增权限信息")
    @RequestMapping(value = "add/Permission", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult insert(@RequestBody AuthPermission entity) {
        //信息校验
        ComplexResult result = FluentValidator.checkAll()
                .on(entity.getName(), new LengthValidator(1, 30, "权限名称"))
                .on(entity.getMethod(), new LengthValidator(1, 10, "请求类型"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new BaseResult(BaseResultEnum.ERROR, result.getErrors().get(0).getErrorMsg());
        }
        entity.setCtime(System.currentTimeMillis());
        return super.insert(entity);
    }
    @ApiOperation(value = "新增权限信息带生成",notes = "新增权限信息带生成")
    @RequestMapping(value = "add/PermissionAuto", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult insert(@RequestBody Map<String, Object> params) {
        LOGGER.error(params.toString());
        AuthPermission authPermission = new AuthPermission();
        MapUtil.mapToBean(params,authPermission);
        //信息校验
        ComplexResult result = FluentValidator.checkAll()
                .on(authPermission.getName(), new LengthValidator(1, 30, "权限名称"))
                .on(authPermission.getMethod(), new LengthValidator(1, 10, "请求类型"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new BaseResult(BaseResultEnum.ERROR, result.getErrors().get(0).getErrorMsg());
        }
        authPermission.setCtime(System.currentTimeMillis());
        if (null != params.get("auto") && (boolean)params.get("auto") && (authPermission.getType() == 1 || authPermission.getType() == 2)){
            if (service.insertPermissionAndAutoGenPermisson(authPermission)){
                return new BaseResult(BaseResultEnum.SUCCESS,"新增权限成功");
            }else {return new BaseResult(BaseResultEnum.ERROR,"新增权限失败");}
        }
        return super.insert(authPermission);
    }

    @Override
    @ApiOperation(value = "根据ID删除权限信息",notes = "根据ID删除权限信息  -  禁用")
    @RequestMapping(value = "delete/Permission", method = RequestMethod.DELETE)
    public BaseResult deleteById(String id) {
        //return super.deleteById(id);
        return null;
    }

    @ApiOperation(value = "根据ID删除权限信息Auto",notes = "根据ID删除权限信息Auto")
    @RequestMapping(value = "delete/PermissionAuto", method = RequestMethod.DELETE)
    public BaseResult PermissionAuto(String id) {
        if (service.deletePermissionAndUse(id)){
            return new BaseResult(BaseResultEnum.SUCCESS,"删除权限成功");
        }else {return new BaseResult(BaseResultEnum.ERROR,"删除权限失败");}
    }

    @Override
    @ApiOperation(value = "根据ID修改权限信息",notes = "根据ID修改权限信息")
    @RequestMapping(value = "update/Permission", method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult updateById(@RequestBody AuthPermission entity) {
        //信息校验
        ComplexResult result = FluentValidator.checkAll()
                .on(entity.getName(), new LengthValidator(1, 30, "权限名称"))
                .on(entity.getMethod(), new LengthValidator(1, 10, "请求类型"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new BaseResult(BaseResultEnum.ERROR, result.getErrors().get(0).getErrorMsg());
        }
        return super.updateById(entity);
    }

    @Override
    @ApiOperation(value = "根据ID查询权限信息",notes = "根据ID查询权限信息")
    @RequestMapping(value = "select/Permission", method = RequestMethod.GET)
    public BaseResult<AuthPermission> selectById(String id) {
        return super.selectById(id);
    }

    @Override
    @ApiOperation(value = "查询权限信息分页",notes = "查询权限信息分页")
    @RequestMapping(value = "select/PagePermission", method = RequestMethod.GET)
    public BaseResult<Page<AuthPermission>> selectPage(@RequestParam Map<String, Object> params) {
        return super.selectPage(params);
    }

    @ApiOperation(value = "查询所有权限信息",notes = "查询所有权限信息")
    @RequestMapping(value = "select/AllPermission", method = RequestMethod.GET)
    @Override
    public BaseResult<List<AuthPermission>> selectAll(@RequestParam Map<String, Object> params) {
        Query query = new Query(params);
        return new BaseResult(BaseResultEnum.SUCCESS,service.selectList(query.getEntityWrapper()));
    }

}
