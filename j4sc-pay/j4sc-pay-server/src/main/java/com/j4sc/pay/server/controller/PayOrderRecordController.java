package com.j4sc.pay.server.controller;

import com.j4sc.common.base.BaseApiService;
import com.j4sc.common.base.BaseController;
import com.j4sc.pay.dao.entity.PayOrderRecord;
import com.j4sc.pay.rest.api.PayOrderRecordService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/5/14 15:34
 * @Version: 1.0
 **/
@RestController
@RequestMapping("PayOrderRecord")
public class PayOrderRecordController extends BaseController<PayOrderRecord,PayOrderRecordService> implements BaseApiService<PayOrderRecord> {
}