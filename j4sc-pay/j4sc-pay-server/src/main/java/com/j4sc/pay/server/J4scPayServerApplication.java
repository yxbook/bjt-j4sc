package com.j4sc.pay.server;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/28 14:27
 * @Version: 1.0
 **/
@EnableEurekaClient//Eureka服务发现
@EnableAutoConfiguration
@EnableFeignClients//启动rpc
@EnableCircuitBreaker//开启容错
@EnableHystrixDashboard//监控面板
@ComponentScan(basePackages = {"com.j4sc"})//多包扫描
public class J4scPayServerApplication {
    private static final Logger LOGGER = LoggerFactory.getLogger(J4scPayServerApplication.class);

    public static void main(String[] args) {

        LOGGER.info(">>>>>j4sc-pay-server 开始启动>>>>>");

        new SpringApplicationBuilder(J4scPayServerApplication.class).web(WebApplicationType.SERVLET).run(args);

        LOGGER.info(">>>>>j4sc-pay-server 启动完成>>>>>");
    }
}
