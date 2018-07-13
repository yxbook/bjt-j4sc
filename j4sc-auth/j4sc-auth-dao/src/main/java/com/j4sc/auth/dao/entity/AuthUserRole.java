package com.j4sc.auth.dao.entity;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 用户角色关联表
 * </p>
 *
 * @author LongRou
 * @since 2018-03-29
 */
@TableName("auth_user_role")
public class AuthUserRole extends Model<AuthUserRole> {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "user_role_id", type = IdType.AUTO)
    private Integer userRoleId;
    /**
     * 用户编号
     */
    @TableField("user_id")
    private Integer userId;
    /**
     * 角色编号
     */
    @TableField("role_id")
    private Integer roleId;


    public Integer getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(Integer userRoleId) {
        this.userRoleId = userRoleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    @Override
    protected Serializable pkVal() {
        return this.userRoleId;
    }

    @Override
    public String toString() {
        return "AuthUserRole{" +
        ", userRoleId=" + userRoleId +
        ", userId=" + userId +
        ", roleId=" + roleId +
        "}";
    }
}
