package com.yk.user.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.yk.user.domain.User;
import com.yk.user.email.MailRequest;
import com.yk.user.email.SendMailService;
import com.yk.user.mapper.UserMapper;
import com.yk.user.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @program: boot-dubbo
 * @description:
 * @author: DEFAULT
 * @create: 2021-11-16 17:00
 **/
@Service(version = "1.0.0")
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    UserMapper userMapper;

    @Autowired
    SendMailService sendMailService;

    @Override
    public String sayHello(String str) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return dateFormat.format(new Date()) + ": " + str;
    }

    @Override
    public User findUser(Long userId) {
//        User user = new User();
//        user.setId(1001);
//        user.setUsername("scott");
//        user.setPassword("tiger");
//        user.setAge(20);
//        user.setGender(0);
        List<User> users = userMapper.selectList(null);
        return users==null?null:users.get(0);
    }

    @Override
    public List<User> findUsers(String username) {
        username = StringUtils.isEmpty(username)?null:username;
        List<User> users = userMapper.selectList(username);
        return users;
    }

    @Override
    public void addUser(User user) {
        userMapper.insert(user);
        MailRequest mailRequest = new MailRequest();
        mailRequest.setSendTo(user.getEmail());
        mailRequest.setSubject("welcome freshman " + user.getUsername());
        mailRequest.setText("哈哈哈哈哈哈哈哈哈哈哈哈哈哈！");
        try{
            sendMailService.sendSimpleMail(mailRequest);
        }catch (Exception e){
            logger.error("send mail error:",e);
        }
    }

    @Override
    public void deleteUser(User user) {
        userMapper.delete(user.getId());
    }

    @Override
    public void editUser(User user) {
        userMapper.edit(user);
    }
}

