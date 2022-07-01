package com.yk.user.domain;

/**
 * @program: boot-dubbo
 * @description:
 * @author: DEFAULT
 * @create: 2021-11-16 16:57
 **/
import lombok.Data;

import java.io.Serializable;

@Data
public class User implements Serializable {
    private Integer id;
    private String username;
    private String password;
    private Integer age;
    private Integer gender;
    private String nickname;
    private String avatar;
    private String email;
}

