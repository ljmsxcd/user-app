package com.yk.user.controller;

import com.alibaba.dubbo.config.annotation.Reference;

import com.yk.user.common.ListResult;
import com.yk.user.common.SingleResult;
import com.yk.user.domain.User;
import com.yk.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @program: boot-dubbo
 * @description:
 * @author: DEFAULT
 * @create: 2021-11-16 17:05
 **/
@Controller
@RequestMapping("/user")
public class UserController {

    @Reference(version = "1.0.0")
    private UserService userService;

    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("name", "dalaoyang");
        return "userList";
    }

    @GetMapping("hello")
    public String hello() {
        return userService.sayHello("Hello springboot and dubbo!");
    }

    @GetMapping("/{id}")
    @ResponseBody
    public User user(@PathVariable("id")Long id) {
        return userService.findUser(id);
    }

    @PostMapping("/list")
    @ResponseBody
    public ListResult<User> selectUserList(@RequestBody Map<String,Object> param) {
        List<User> userList = userService.findUsers((String)param.get("username"));
        return new ListResult<User>(userList);
    }

    @PostMapping("/add")
    @ResponseBody
    public SingleResult<String> addUser(@RequestBody User user) {
        userService.addUser(user);
        return new SingleResult<String>("");
    }

    @PostMapping("/delete")
    @ResponseBody
    public SingleResult<String> deleteUser(@RequestBody User user) {
        userService.deleteUser(user);
        return new SingleResult<String>("");
    }

    @PostMapping("/edit")
    @ResponseBody
    public SingleResult<String> editUser(@RequestBody User user) {
        userService.editUser(user);
        return new SingleResult<String>("");
    }
}

