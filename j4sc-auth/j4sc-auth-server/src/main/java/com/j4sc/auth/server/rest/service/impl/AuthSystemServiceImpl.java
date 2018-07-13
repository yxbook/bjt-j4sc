package com.j4sc.auth.server.rest.service.impl;

import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.auth.dao.mapper.AuthSystemMapper;
import com.j4sc.auth.dao.entity.AuthSystem;
import com.j4sc.auth.rest.api.AuthSystemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @Description: AuthSystem Service实现
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
@Service
@Transactional
@BaseService
public class AuthSystemServiceImpl extends BaseServiceImpl<AuthSystemMapper, AuthSystem> implements AuthSystemService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthSystemServiceImpl.class);

}