package com.yk.user;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

/**
 * @program: boot-dubbo
 * @description:
 * @author: DEFAULT
 * @create: 2021-11-16 17:08
 **/
@SpringBootApplication
@ImportResource({"classpath:spring-dubbo.xml"})
public class ConsumerApplication {

    public static void main(String[] args) {

        SpringApplication.run(ConsumerApplication.class, args);
    }

}

