package com.j4sc.auth.server.rest.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.j4sc.auth.dao.entity.AuthRolePermission;
import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.auth.dao.mapper.AuthUserRoleMapper;
import com.j4sc.auth.dao.entity.AuthUserRole;
import com.j4sc.auth.rest.api.AuthUserRoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
* @Description: AuthUserRole Service实现
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
@Service
@Transactional
@BaseService
public class AuthUserRoleServiceImpl extends BaseServiceImpl<AuthUserRoleMapper, AuthUserRole> implements AuthUserRoleService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthUserRoleServiceImpl.class);
    //根据角色ID替换权限
    @Override
    public boolean replaceRoleByRoleId(Integer id, List<Integer> permissionList) {
        baseMapper.delete(new EntityWrapper<AuthUserRole>().eq("user_id",id));
        AuthUserRole authUserRole = new AuthUserRole();
        authUserRole.setUserId(id);
        permissionList.forEach(item ->{
            authUserRole.setRoleId(item);
            baseMapper.insert(authUserRole);
        });
        return true;
    }
}