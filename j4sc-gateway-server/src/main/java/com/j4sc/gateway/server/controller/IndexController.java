package com.j4sc.gateway.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/5/16 16:31
 * @Version: 1.0
 **/
//@Controller
//@RequestMapping
public class IndexController {
    @RequestMapping()
    public String index() {
        System.out.println("index");
        return "index";
    }
    @GetMapping("bjts")
    public String bjtindex() {
        System.out.println("ssssssssssss");
        return "bjtindex";
    }
}
