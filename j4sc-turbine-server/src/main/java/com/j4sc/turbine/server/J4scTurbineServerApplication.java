package com.j4sc.turbine.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.netflix.turbine.EnableTurbine;

/**
 * @Description: ZipkinServer
 * @Author: LongRou
 * @CreateDate: 2018 2018/3/22 17:05
 * @Version: 1.0
 **/
@EnableAutoConfiguration
@EnableTurbine
@EnableHystrixDashboard
@EnableEurekaClient
public class J4scTurbineServerApplication {

    public static void main(String[] args) {
        //new SpringApplicationBuilder(J4scTurbineServerApplication.class).web(WebApplicationType.SERVLET).run(args);
        SpringApplication.run(J4scTurbineServerApplication.class, args);
    }

}
