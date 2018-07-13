package com.j4sc.common.base;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/5/11 17:56
 * @Version: 1.0
 **/
public enum OrderStateEnum {
    CREATE(0,"交易创建"),
    CLOSE(-1,"交易关闭"),
    SUCCESS(1,"交易成功"),
    FINISH(2,"交易完成");

    public int state;
    public String name;

    OrderStateEnum(int state, String name) {
        this.state = state;
        this.name = name;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
