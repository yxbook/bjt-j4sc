package com.j4sc.common.base;

/**
 * @Description: JWTInfo接口
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/26 14:52
 * @Version: 1.0
 **/
public interface BaseJWTInfo {
    /**
     * 获取用户名
     * @return
     */
    String getUniqueName();

    /**
     * 获取用户ID
     * @return
     */
    String getId();

    /**
     * 获取名称
     * @return
     */
    String getName();
}
