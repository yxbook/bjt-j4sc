package com.j4sc.auth.server.rest.service.impl;

import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.auth.dao.mapper.AuthOrganizationMapper;
import com.j4sc.auth.dao.entity.AuthOrganization;
import com.j4sc.auth.rest.api.AuthOrganizationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @Description: AuthOrganization Service实现
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
@Service
@Transactional
@BaseService
public class AuthOrganizationServiceImpl extends BaseServiceImpl<AuthOrganizationMapper, AuthOrganization> implements AuthOrganizationService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthOrganizationServiceImpl.class);

}