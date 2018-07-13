package com.j4sc.pay.server.controller;

import com.j4sc.common.base.BaseApiService;
import com.j4sc.common.base.BaseController;
import com.j4sc.pay.dao.entity.PayOrder;
import com.j4sc.pay.rest.api.PayOrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/5/14 15:31
 * @Version: 1.0
 **/
@RestController
@RequestMapping("PayOrder")
public class PayOrderController extends BaseController<PayOrder,PayOrderService> implements BaseApiService<PayOrder> {
}
