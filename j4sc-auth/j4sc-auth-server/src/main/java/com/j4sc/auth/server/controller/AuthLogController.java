package com.j4sc.auth.server.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.j4sc.auth.dao.entity.AuthLog;
import com.j4sc.auth.rest.api.AuthLogService;
import com.j4sc.common.base.BaseApiService;
import com.j4sc.common.base.BaseController;
import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/29 18:16
 * @Version: 1.0
 **/
@RestController
@RequestMapping("AuthLog")
public class AuthLogController extends BaseController<AuthLog,AuthLogService> implements BaseApiService<AuthLog>{

    @Autowired
    AuthLogService authLogService;

    @RequestMapping(value = "/test" ,method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
    public BaseResult test(@RequestBody List<String> list){
        System.out.println("sss:" + list);
        Page<AuthLog> tPage =new Page<AuthLog>(1,5);
        tPage.setSearchCount(true);
        return new BaseResult(BaseResultEnum.SUCCESS,authLogService.selectPage(tPage));
    }

}

