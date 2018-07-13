package com.j4sc.gateway.server;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @Description: 网关服务器
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/24 18:29
 * @Version: 1.0
 **/
@EnableAutoConfiguration(exclude ={DataSourceAutoConfiguration.class,DruidDataSourceAutoConfigure.class})
@SpringBootApplication
@EnableCircuitBreaker//开启容错
//@EnableHystrixDashboard//监控面板
@EnableFeignClients//启动rpc
@ComponentScan(basePackages = {"com.j4sc"})//多包扫描
public class J4scGatewayServerApplication {

    public static void main(String[] args) {
        //new SpringApplicationBuilder(J4scGatewayServerApplication.class).web(WebApplicationType.SERVLET).run(args);
        SpringApplication.run(J4scGatewayServerApplication.class, args);
    }
}
