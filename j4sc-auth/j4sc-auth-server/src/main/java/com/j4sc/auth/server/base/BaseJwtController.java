package com.j4sc.auth.server.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;

import javax.servlet.http.HttpServletRequest;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/2 14:20
 * @Version: 1.0
 **/
public class BaseJwtController {

    @Autowired
    @Lazy
    protected HttpServletRequest request;
    public String getUserId() {
        return request.getHeader("userId");
    }
}
