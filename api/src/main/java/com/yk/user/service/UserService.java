package com.yk.user.service;

import com.yk.user.domain.User;

import java.util.List;

/**
 * @program: boot-dubbo
 * @description:
 * @author: DEFAULT
 * @create: 2021-11-16 16:58
 **/
public interface UserService {

    String sayHello(String str);

    User findUser(Long userId);

    List<User> findUsers(String username);

    void addUser(User user);

    void deleteUser(User user);

    void editUser(User user);
}

