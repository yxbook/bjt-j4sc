package com.j4sc.auth.server.rest.service.impl;

import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.auth.dao.mapper.AuthUserMapper;
import com.j4sc.auth.dao.entity.AuthUser;
import com.j4sc.auth.rest.api.AuthUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @Description: AuthUser Service实现
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
@Service
@Transactional
@BaseService
public class AuthUserServiceImpl extends BaseServiceImpl<AuthUserMapper, AuthUser> implements AuthUserService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthUserServiceImpl.class);

}