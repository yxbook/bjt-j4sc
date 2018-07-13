package com.j4sc.system.server.controller;

import com.j4sc.common.base.BaseResult;
import com.j4sc.common.base.BaseResultEnum;
import com.j4sc.system.server.client.AuthKeyClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/5/4 18:14
 * @Version: 1.0
 **/
@Controller
@RequestMapping("t")
public class TController {
    @Autowired
    AuthKeyClient authKeyClient;
    @RequestMapping
    public String index() {
        System.out.println("ssssssssdfsdssss");
        return "indexs";
    }
    @RequestMapping("ss")
    @ResponseBody
    public BaseResult ss() {
        System.out.println("ss11111");
        return new BaseResult(BaseResultEnum.SUCCESS,authKeyClient.getUserPublicKey());
    }
}
