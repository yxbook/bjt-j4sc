package com.j4sc.common.base;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONWrappedObject;
import org.apache.catalina.User;

import java.io.Serializable;

/**
 * @Description: 基础返回结果
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/13 15:55
 * @Version: 1.0
 **/
public class BaseResult<T> implements Serializable{
    /**
     * 状态码：200成功，其他为失败
     */
    public int status;

    /**
     * 成功为success，其他为失败原因
     */
    public String message;

    /**
     * 数据结果集
     */
    public T data;


    @Override
    public String toString() {
        return "BaseResult{" +
                "status=" + status +
                ", message='" + message + '\'' +
                ", data=" + data +
                '}';
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
    public BaseResult(BaseResultEnum baseResultEnum,
                      T data) {
        this(baseResultEnum.getStatus(), baseResultEnum.getMsg(), data);

    }

    //反序列化
    @JsonCreator
    public BaseResult(@JsonProperty(value = "status",required = true) int status,
                      @JsonProperty(value = "message",required = true) String message,
                      @JsonProperty(value = "data",required = true) T data) {

        this.status = status;
        this.message = message;
        if (status == BaseResultEnum.SUCCESS.status)this.data = data;
        else if (null != data)this.message = (String) data;
    }

}
