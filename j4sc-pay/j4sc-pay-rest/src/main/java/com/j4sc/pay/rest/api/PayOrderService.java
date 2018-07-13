package com.j4sc.pay.rest.api;

import com.j4sc.common.base.BaseService;
import com.j4sc.common.base.OrderStateEnum;
import com.j4sc.pay.dao.entity.PayOrder;

import java.io.Serializable;

/**
* @Description: PayOrder Service接口
* @Author: LongRou
* @CreateDate: 2018/5/11.
* @Version: 1.0
**/
public interface PayOrderService extends BaseService<PayOrder> {
    /**
     * 新建订单并插入记录
     * @param payOrder
     * @return
     */
    boolean insertAndRecord(PayOrder payOrder);

    /**
     * 根据ID更新订单并插入记录
     * @param id
     * @param state
     * @return
     */
    boolean updateAndRecordById(Serializable id,OrderStateEnum state);
}