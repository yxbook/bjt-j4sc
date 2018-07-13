package com.j4sc.pay.server.rest.service.impl;

import com.j4sc.common.annotation.BaseService;
import com.j4sc.common.base.BaseServiceImpl;
import com.j4sc.common.base.OrderStateEnum;
import com.j4sc.pay.dao.entity.PayOrderRecord;
import com.j4sc.pay.dao.mapper.PayOrderMapper;
import com.j4sc.pay.dao.entity.PayOrder;
import com.j4sc.pay.rest.api.PayOrderRecordService;
import com.j4sc.pay.rest.api.PayOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

/**
 * @Description: PayOrder Service实现
 * @Author: LongRou
 * @CreateDate: 2018/5/11.
 * @Version: 1.0
 **/
@Service
@Transactional
@BaseService
public class PayOrderServiceImpl extends BaseServiceImpl<PayOrderMapper, PayOrder> implements PayOrderService {

    private static final Logger LOGGER = LoggerFactory.getLogger(PayOrderServiceImpl.class);
    @Autowired
    PayOrderRecordService payOrderRecordService;

    @Override
    public boolean insertAndRecord(PayOrder payOrder) {
        if (insert(payOrder)) {
            PayOrderRecord payOrderRecord = new PayOrderRecord();
            payOrderRecord.setOrderId(payOrder.getOrderId());
            payOrderRecord.setType(OrderStateEnum.CREATE.state);
            payOrderRecord.setContent(OrderStateEnum.CREATE.name);
            payOrderRecord.setCtime(System.currentTimeMillis());
            if (payOrderRecordService.insert(payOrderRecord)) {
                return true;
            }
        }
        return false;

    }

    @Override
    public boolean updateAndRecordById(Serializable id, OrderStateEnum state) {

        PayOrder payOrder = selectById(id);
        payOrder.setState(state.state);
        if (updateById(payOrder)){
            PayOrderRecord payOrderRecord = new PayOrderRecord();
            payOrderRecord.setOrderId(payOrder.getOrderId());
            payOrderRecord.setType(state.state);
            payOrderRecord.setContent(state.name);
            payOrderRecord.setCtime(System.currentTimeMillis());
            if (payOrderRecordService.insert(payOrderRecord)) {
                return true;
            }
        }
        return false;
    }
}