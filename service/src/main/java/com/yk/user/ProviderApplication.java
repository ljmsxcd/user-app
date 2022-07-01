package com.yk.user;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.concurrent.CountDownLatch;

/**
 * @program: boot-dubbo
 * @description:
 * @author: DEFAULT
 * @create: 2021-11-16 17:03
 **/
@SpringBootApplication
@ImportResource({"classpath:spring-dubbo.xml"})
@MapperScan("com.yk.user.mapper")
@EnableTransactionManagement
public class ProviderApplication {

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(ProviderApplication.class);
        application.setWebApplicationType(WebApplicationType.NONE);// 设置不需要用到web ApplicationContext
        application.run(args);
        try {
            CountDownLatch countDownLatch = new CountDownLatch(1);
            countDownLatch.await();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

