package com.j4sc.system.server.impl;

import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.system.dao.entity.OssLog;
import com.j4sc.system.dao.mapper.OssLogMapper;
import com.j4sc.system.rest.api.OssLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @Description: OssLog Service实现
* @Author: LongRou
* @CreateDate: 2018/4/4.
* @Version: 1.0
**/
@Service
@Transactional
@BaseService
public class OssLogServiceImpl extends BaseServiceImpl<OssLogMapper, OssLog> implements OssLogService {

    private static final Logger LOGGER = LoggerFactory.getLogger(OssLogServiceImpl.class);

}