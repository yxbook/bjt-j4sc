package com.j4sc.common.base;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * @Description: BaseServiceImpl实现基类
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/14 12:17
 * @Version: 1.0
 **/
public class BaseServiceImpl<M extends BaseMapper<T>, T> extends ServiceImpl<BaseMapper<T>, T> {

}
