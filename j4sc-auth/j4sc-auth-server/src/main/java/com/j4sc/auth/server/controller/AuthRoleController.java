package com.j4sc.auth.server.controller;

import com.baidu.unbiz.fluentvalidator.ComplexResult;
import com.baidu.unbiz.fluentvalidator.FluentValidator;
import com.baidu.unbiz.fluentvalidator.ResultCollectors;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.j4sc.auth.dao.entity.AuthRole;
import com.j4sc.auth.dao.entity.AuthRolePermission;
import com.j4sc.auth.dao.entity.AuthUserRole;
import com.j4sc.auth.rest.api.AuthRolePermissionService;
import com.j4sc.auth.rest.api.AuthRoleService;
import com.j4sc.auth.rest.api.AuthUserRoleService;
import com.j4sc.common.base.BaseApiService;
import com.j4sc.common.base.BaseController;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import com.j4sc.common.validator.LengthValidator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/11 10:44
 * @Version: 1.0
 **/
@RestController
@RequestMapping("role")
@Api(tags = {"系统角色管理"}, description = "系统角色管理")
public class AuthRoleController extends BaseController<AuthRole,AuthRoleService> implements BaseApiService<AuthRole> {
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthRoleController.class);

    @Autowired
    private AuthRolePermissionService authRolePermissionService;
    @Autowired
    private AuthUserRoleService authUserRoleService;

    @Override
    @ApiOperation(value = "新增角色信息",notes = "新增角色信息")
    @RequestMapping(value = "add/Role", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult insert(@RequestBody AuthRole entity) {
        //信息校验
        ComplexResult result = FluentValidator.checkAll()
                .on(entity.getName(), new LengthValidator(1, 30, "角色名称"))
                .on(entity.getTitle(), new LengthValidator(1, 32, "角色标题"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new BaseResult(BaseResultEnum.ERROR, result.getErrors().get(0).getErrorMsg());
        }
        entity.setCtime(System.currentTimeMillis());
        entity.setOrders(System.currentTimeMillis());
        return super.insert(entity);
    }

    @Override
    @ApiOperation(value = "根据ID删除角色信息",notes = "根据ID删除角色信息")
    @RequestMapping(value = "delete/Role", method = RequestMethod.DELETE)
    public BaseResult deleteById(String id) {
        return super.deleteById(id);
//        if (service.deleteRoleById(id))return new BaseResult(BaseResultEnum.SUCCESS, "删除成功");
//        else return new BaseResult(BaseResultEnum.ERROR,"删除失败");
    }

    @Override
    @ApiOperation(value = "根据ID修改角色信息",notes = "根据ID修改角色信息")
    @RequestMapping(value = "update/Role", method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult updateById(@RequestBody AuthRole entity) {
        //信息校验
        ComplexResult result = FluentValidator.checkAll()
                .on(entity.getName(), new LengthValidator(1, 30, "角色名称"))
                .on(entity.getTitle(), new LengthValidator(1, 32, "角色标题"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new BaseResult(BaseResultEnum.ERROR, result.getErrors().get(0).getErrorMsg());
        }
        return super.updateById(entity);
    }

    @Override
    @ApiOperation(value = "根据ID查询角色信息",notes = "根据ID查询角色信息")
    @RequestMapping(value = "select/Role", method = RequestMethod.GET)
    public BaseResult<AuthRole> selectById(String id) {
        return super.selectById(id);
    }

    @Override
    @ApiOperation(value = "查询角色信息分页",notes = "查询角色信息分页")
    @RequestMapping(value = "select/PageRole", method = RequestMethod.GET)
    public BaseResult<Page<AuthRole>> selectPage(@RequestParam Map<String, Object> params) {
        return super.selectPage(params);
    }

    @ApiOperation(value = "查询所有角色信息",notes = "查询所有角色信息")
    @RequestMapping(value = "select/AllRole", method = RequestMethod.GET)
    @Override
    public BaseResult<List<AuthRole>> selectAll(@RequestParam Map<String, Object> params) {
        return super.selectAll(params);
    }

    @ApiOperation(value = "根据角色id获取所拥有的权限",notes = "根据角色id获取所拥有的权限")
    @RequestMapping(value = "select/getPermissionByRoleId", method = RequestMethod.GET)
    public BaseResult<List<AuthRolePermission>> selectAuthRolePermisstionByAuthRoleId(@RequestParam("id") String id) {
        List<AuthRolePermission> list = authRolePermissionService.selectList(new EntityWrapper<AuthRolePermission>().eq("role_id",id));
        return new BaseResult(BaseResultEnum.SUCCESS,list);
    }

    @ApiOperation(value = "根据用户id获取所拥有的角色",notes = "根据角色id获取所拥有的权限")
    @RequestMapping(value = "select/getRoleByUserId", method = RequestMethod.GET)
    public BaseResult<List<AuthUserRole>> selectAuthRoleByUserId(@RequestParam("id") String id) {
        List<AuthUserRole> list = authUserRoleService.selectList(new EntityWrapper<AuthUserRole>().eq("user_id",id));
        return new BaseResult(BaseResultEnum.SUCCESS,list);
    }

    @ApiOperation(value = "为角色添加权限",notes = "为角色添加权限")
    @RequestMapping(value = "add/addPermissionByRoleId", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult insertPermissionByRoleId(@RequestBody Map<String, Object> params) {
        LOGGER.error(params.toString());
        AuthRole authRole = service.selectById((Integer)params.get("rodeId"));
        if (null == authRole){return new BaseResult(BaseResultEnum.ERROR,"角色不存在！");}
        List<Integer> list = (List<Integer>) params.get("list");
        LOGGER.error(list.toString());
        if (authRolePermissionService.replacePermissionByRoleId(authRole.getRoleId(),list)){return new BaseResult(BaseResultEnum.SUCCESS,"保存成功");}
        return new BaseResult(BaseResultEnum.ERROR,"更新权限失败");
    }
}
