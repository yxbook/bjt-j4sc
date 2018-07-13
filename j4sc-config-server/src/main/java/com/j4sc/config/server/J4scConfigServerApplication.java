package com.j4sc.config.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

/**
 * @Description: 配置中心服务
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/20 18:19
 * @Version: 1.0
 **/
@SpringBootApplication
@EnableConfigServer
public class J4scConfigServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(J4scConfigServerApplication.class, args);
    }
}
