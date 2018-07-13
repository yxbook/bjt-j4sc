package com.j4sc.auth.server.controller;

import com.baidu.unbiz.fluentvalidator.ComplexResult;
import com.baidu.unbiz.fluentvalidator.FluentValidator;
import com.baidu.unbiz.fluentvalidator.ResultCollectors;
import com.baomidou.mybatisplus.plugins.Page;
import com.j4sc.auth.dao.entity.AuthLog;
import com.j4sc.auth.dao.entity.AuthSystem;
import com.j4sc.auth.rest.api.AuthLogService;
import com.j4sc.auth.rest.api.AuthSystemService;
import com.j4sc.common.base.BaseApiService;
import com.j4sc.common.base.BaseController;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import com.j4sc.common.validator.LengthValidator;
import com.j4sc.common.validator.NotNullValidator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/10 10:51
 * @Version: 1.0
 **/
@RestController
@RequestMapping("system")
@Api(tags = {"系统应用管理"}, description = "系统应用管理")
public class AuthSystemController extends BaseController<AuthSystem,AuthSystemService> implements BaseApiService<AuthSystem> {
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthSystemController.class);

    @Override
    @ApiOperation(value = "新增系统信息",notes = "新增系统信息")
    @RequestMapping(value = "add/System", method = RequestMethod.POST ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult insert(@RequestBody AuthSystem entity) {
        //信息校验
        ComplexResult result = FluentValidator.checkAll()
                .on(entity.getName(), new LengthValidator(1, 30, "系统名称"))
                .on(entity.getTitle(), new LengthValidator(5, 32, "系统标题"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new BaseResult(BaseResultEnum.ERROR, result.getErrors().get(0).getErrorMsg());
        }
        entity.setCtime(System.currentTimeMillis());
        return super.insert(entity);
    }

    @Override
    @ApiOperation(value = "根据ID删除系统信息",notes = "根据ID删除系统信息")
    @RequestMapping(value = "delete/System", method = RequestMethod.DELETE ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult deleteById(String id) {
        return super.deleteById(id);
    }

    @Override
    @ApiOperation(value = "根据ID修改系统信息",notes = "根据ID修改系统信息")
    @RequestMapping(value = "update/System", method = RequestMethod.PUT ,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult updateById(@RequestBody AuthSystem entity) {
        //信息校验
        ComplexResult result = FluentValidator.checkAll()
                .on(entity.getName(), new LengthValidator(1, 30, "系统名称"))
                .on(entity.getTitle(), new LengthValidator(5, 32, "系统标题"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new BaseResult(BaseResultEnum.ERROR, result.getErrors().get(0).getErrorMsg());
        }
        return super.updateById(entity);
    }

    @Override
    @ApiOperation(value = "根据ID查询系统信息",notes = "根据ID查询系统信息")
    @RequestMapping(value = "select/System", method = RequestMethod.GET)
    public BaseResult<AuthSystem> selectById(String id) {
        return super.selectById(id);
    }

    @Override
    @ApiOperation(value = "查询系统信息分页",notes = "查询系统信息分页")
    @RequestMapping(value = "select/PageSystem", method = RequestMethod.GET)
    public BaseResult<Page<AuthSystem>> selectPage(@RequestParam Map<String, Object> params) {
        return super.selectPage(params);
    }

    @ApiOperation(value = "查询所有系统信息",notes = "查询所有系统信息")
    @RequestMapping(value = "select/AllSystem", method = RequestMethod.GET)
    @Override
    public BaseResult<List<AuthSystem>> selectAll(@RequestParam Map<String, Object> params) {
        return super.selectAll(params);
    }
}
