package com.j4sc.common.base;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @Description: Service基础类 方便后期拓展
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/14 12:14
 * @Version: 1.0
 **/
public interface BaseService<T> extends IService<T> {
}
