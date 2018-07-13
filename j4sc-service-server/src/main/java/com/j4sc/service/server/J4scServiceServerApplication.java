package com.j4sc.service.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * @Description: J4sc服务中心
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/16 17:45
 * @Version: 1.0
 **/
@SpringBootApplication
@EnableEurekaServer
public class J4scServiceServerApplication {

    public static void main(String[] args) {
        new SpringApplicationBuilder(J4scServiceServerApplication.class).web(WebApplicationType.SERVLET).run(args);
        //SpringApplication.run(J4scServiceServerApplication.class, args);
    }
}
