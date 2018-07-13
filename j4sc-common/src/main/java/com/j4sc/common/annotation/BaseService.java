package com.j4sc.common.annotation;

import java.lang.annotation.*;

/**
 * @Description: 初始化继承BaseService的service
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/13 17:56
 * @Version: 1.0
 **/
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface BaseService {
}
