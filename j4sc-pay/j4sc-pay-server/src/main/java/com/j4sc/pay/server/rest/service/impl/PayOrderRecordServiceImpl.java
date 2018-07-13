package com.j4sc.pay.server.rest.service.impl;

import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.pay.dao.mapper.PayOrderRecordMapper;
import com.j4sc.pay.dao.entity.PayOrderRecord;
import com.j4sc.pay.rest.api.PayOrderRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @Description: PayOrderRecord Service实现
* @Author: LongRou
* @CreateDate: 2018/5/11.
* @Version: 1.0
**/
@Service
@Transactional
@BaseService
public class PayOrderRecordServiceImpl extends BaseServiceImpl<PayOrderRecordMapper, PayOrderRecord> implements PayOrderRecordService {

    private static final Logger LOGGER = LoggerFactory.getLogger(PayOrderRecordServiceImpl.class);

}