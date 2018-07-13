package com.j4sc.auth.common.jwt;

import com.j4sc.common.base.BaseJWTInfo;

import java.io.Serializable;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 11:29
 * @Version: 1.0
 **/
public class JwtInfo implements Serializable,BaseJWTInfo {
    private String username;
    private String userId;
    private String name;


    @Override
    public String getUniqueName() {
        return username;
    }

    @Override
    public String getId() {
        return userId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public JwtInfo(String username, String userId, String name) {

        this.username = username;
        this.userId = userId;
        this.name = name;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        JwtInfo jwtInfo = (JwtInfo) o;

        if (username != null ? !username.equals(jwtInfo.username) : jwtInfo.username != null) {
            return false;
        }
        return userId != null ? userId.equals(jwtInfo.userId) : jwtInfo.userId == null;

    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "JwtInfo{" +
                "username='" + username + '\'' +
                ", userId='" + userId + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}