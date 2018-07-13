package com.j4sc.auth.rest.api;

import com.j4sc.auth.dao.entity.AuthPermission;
import com.j4sc.auth.dao.entity.AuthRolePermission;
import com.j4sc.common.base.BaseService;
import io.swagger.models.auth.In;

import java.io.Serializable;
import java.util.List;

/**
* @Description: AuthRolePermission Service接口
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
public interface AuthRolePermissionService extends BaseService<AuthRolePermission> {
    boolean replacePermissionByRoleId(Integer id, List<Integer> permissionList);
}