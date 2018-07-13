package com.j4sc.system.dao.entity;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 文件系统日志表
 * </p>
 *
 * @author LongRou
 * @since 2018-05-07
 */
@TableName("oss_log")
public class OssLog extends Model<OssLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "log_id", type = IdType.AUTO)
    private Integer logId;
    /**
     * 上传用户ID
     */
    @TableField("user_id")
    private String userId;
    /**
     * 地址
     */
    private String source;
    /**
     * 创建时间
     */
    private Long ctime;
    /**
     * 修改时间
     */
    private Long utime;
    /**
     * 备注
     */
    private String remake;


    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public Long getCtime() {
        return ctime;
    }

    public void setCtime(Long ctime) {
        this.ctime = ctime;
    }

    public Long getUtime() {
        return utime;
    }

    public void setUtime(Long utime) {
        this.utime = utime;
    }

    public String getRemake() {
        return remake;
    }

    public void setRemake(String remake) {
        this.remake = remake;
    }

    @Override
    protected Serializable pkVal() {
        return this.logId;
    }

    @Override
    public String toString() {
        return "OssLog{" +
        "logId=" + logId +
        ", userId=" + userId +
        ", source=" + source +
        ", ctime=" + ctime +
        ", utime=" + utime +
        ", remake=" + remake +
        "}";
    }
}
