package com.j4sc.oss.server;

import org.apache.catalina.connector.Connector;
import org.apache.coyote.http11.Http11NioProtocol;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.sleuth.annotation.SleuthAnnotationAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.ClassPathResource;

import java.io.File;
import java.io.IOException;

/**
 * @Description:
 * @Author: LongRou
 * @CreateDate: 2018 2018/4/4 16:01
 * @Version: 1.0
 **/
@EnableEurekaClient//Eureka服务发现
@EnableAutoConfiguration
@EnableFeignClients//启动rpc
@EnableCircuitBreaker//开启容错
@EnableHystrixDashboard//监控面板
@ComponentScan(basePackages = {"com.j4sc"})//多包扫描
public class J4scOssServerApplication {
    private static final Logger LOGGER = LoggerFactory.getLogger(J4scOssServerApplication.class);

    public static void main(String[] args) {

        LOGGER.info(">>>>>j4sc-oss-server 开始启动>>>>>");

        new SpringApplicationBuilder(J4scOssServerApplication.class).web(WebApplicationType.SERVLET).run(args);

        LOGGER.info(">>>>>j4sc-oss-server 启动完成>>>>>");
    }

//    @Bean
//    public ServletWebServerFactory servletContainer() {
//        TomcatServletWebServerFactory tomcat = new TomcatServletWebServerFactory();
//        // 添加http
//        tomcat.addAdditionalTomcatConnectors(createStandardConnector());
//        return tomcat;
//    }
//    // 配置http
//    private Connector createStandardConnector() {
//        Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
////        connector.setPort(8487);
////        return connector;
//        Http11NioProtocol protocol = (Http11NioProtocol) connector.getProtocolHandler();
//        try {
//            File keystore = new ClassPathResource("keystore.p12").getFile();
//            /*File truststore = new ClassPathResource("sample.jks").getFile();*/
//            connector.setScheme("https");
//            connector.setSecure(true);
//            connector.setPort(8487);
//            protocol.setSSLEnabled(true);
//            protocol.setKeystoreFile(keystore.getAbsolutePath());
//            protocol.setKeystorePass("123456");
//            protocol.setKeystoreType("PKCS12");
//            return connector;
//        }
//        catch (IOException ex) {
//            throw new IllegalStateException("can't access keystore: [" + "keystore"
//                    + "] or truststore: [" + "keystore" + "]", ex);
//        }
//    }

}
