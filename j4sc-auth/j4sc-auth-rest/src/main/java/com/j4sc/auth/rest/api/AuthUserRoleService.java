package com.j4sc.auth.rest.api;

import com.j4sc.auth.dao.entity.AuthUserRole;
import com.j4sc.common.base.BaseService;

import java.util.List;

/**
* @Description: AuthUserRole Service接口
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
public interface AuthUserRoleService extends BaseService<AuthUserRole> {
    boolean replaceRoleByRoleId(Integer id, List<Integer> permissionList);
}