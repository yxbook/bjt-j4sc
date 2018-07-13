package com.j4sc.oss.server.controller;

import com.j4sc.common.base.BaseApiService;
import com.j4sc.common.base.BaseController;
import com.j4sc.oss.dao.entity.OssLog;
import com.j4sc.oss.rest.api.OssLogService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/4 15:50
 * @Version: 1.0
 **/
@RestController
@RequestMapping("OssLog")
public class OssLogController extends BaseController<OssLog,OssLogService> implements BaseApiService<OssLog> {
}
