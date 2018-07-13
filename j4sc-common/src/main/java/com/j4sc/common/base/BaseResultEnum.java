package com.j4sc.common.base;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonValue;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.j4sc.common.serializer.BaseResultEnumSerializer;

/**
 * @Description: 接口结果常量枚举类
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 11:31
 * @Version: 1.0
 **/
@JsonSerialize(using = BaseResultEnumSerializer.class)
public enum BaseResultEnum {
    SUCCESS(200,"请求成功"),
    ERROR(503,"请求失败"),
    BLANK(400,"请求错误"),//服务器不理解请求的语法。参数为空
    TIMEOUT(408,"请求超时"),
    NOACCESS(401,"未授权");
    public int status;
    public String msg;
    private BaseResultEnum(int status, String msg) {
        this.status = status;
        this.msg = msg;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
}
