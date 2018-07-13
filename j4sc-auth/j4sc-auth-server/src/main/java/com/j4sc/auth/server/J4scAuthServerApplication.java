package com.j4sc.auth.server;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/27 14:06
 * @Version: 1.0
 **/
@EnableEurekaClient//Eureka服务发现
//@SpringBootApplication
@EnableAutoConfiguration
@EnableFeignClients//启动rpc
@EnableCircuitBreaker//开启容错
@EnableHystrixDashboard//监控面板
@ComponentScan(basePackages = {"com.j4sc"})//多包扫描
@EnableSwagger2
public class J4scAuthServerApplication {
    private static final Logger LOGGER = LoggerFactory.getLogger(J4scAuthServerApplication.class);

    public static void main(String[] args) {
        LOGGER.info(">>>>>J4sc-Auth-Server 开始启动>>>>>");

        SpringApplication.run(J4scAuthServerApplication.class, args);

        LOGGER.info(">>>>>J4sc-Auth-Server 启动完成>>>>>");
    }
}
