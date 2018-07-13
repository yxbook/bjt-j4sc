package com.j4sc.auth.server.rest.service.impl;

import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.auth.dao.mapper.AuthLogMapper;
import com.j4sc.auth.dao.entity.AuthLog;
import com.j4sc.auth.rest.api.AuthLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

/**
* @Description: AuthLog Service实现
* @Author: LongRou
* @CreateDate: 2018/3/27.
* @Version: 1.0
**/
@Service
@Transactional
@BaseService
public class AuthLogServiceImpl extends BaseServiceImpl<AuthLogMapper, AuthLog> implements AuthLogService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthLogServiceImpl.class);

}