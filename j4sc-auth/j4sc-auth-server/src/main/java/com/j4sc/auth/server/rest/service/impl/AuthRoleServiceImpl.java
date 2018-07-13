package com.j4sc.auth.server.rest.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.j4sc.auth.dao.entity.AuthRolePermission;
import com.j4sc.auth.dao.entity.AuthUserRole;
import com.j4sc.auth.rest.api.AuthRolePermissionService;
import com.j4sc.auth.rest.api.AuthUserRoleService;
import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.auth.dao.mapper.AuthRoleMapper;
import com.j4sc.auth.dao.entity.AuthRole;
import com.j4sc.auth.rest.api.AuthRoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

/**
* @Description: AuthRole Service实现
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
@Service
@Transactional
@BaseService
public class AuthRoleServiceImpl extends BaseServiceImpl<AuthRoleMapper, AuthRole> implements AuthRoleService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthRoleServiceImpl.class);
}