package com.j4sc.auth.server.rest.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.auth.dao.mapper.AuthRolePermissionMapper;
import com.j4sc.auth.dao.entity.AuthRolePermission;
import com.j4sc.auth.rest.api.AuthRolePermissionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
* @Description: AuthRolePermission Service实现
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
@Service
@Transactional
@BaseService
public class AuthRolePermissionServiceImpl extends BaseServiceImpl<AuthRolePermissionMapper, AuthRolePermission> implements AuthRolePermissionService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthRolePermissionServiceImpl.class);
    //根据角色ID替换权限
    @Override
    public boolean replacePermissionByRoleId(Integer id, List<Integer> permissionList) {
        baseMapper.delete(new EntityWrapper<AuthRolePermission>().eq("role_id",id));
        AuthRolePermission authRolePermission = new AuthRolePermission();
        authRolePermission.setRoleId(id);
        permissionList.forEach(item ->{
            authRolePermission.setPermissionId(item);
            baseMapper.insert(authRolePermission);
        });
        return true;
    }
}