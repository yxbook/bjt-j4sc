package com.j4sc.auth.rest.api;

import com.j4sc.auth.dao.entity.AuthPermission;
import com.j4sc.common.base.BaseService;

import java.io.Serializable;
import java.util.List;

/**
* @Description: AuthPermission Service接口
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
public interface AuthPermissionService extends BaseService<AuthPermission> {
    boolean insertPermissionAndAutoGenPermisson(AuthPermission entity);
    boolean deletePermissionAndUse(Serializable id);
}