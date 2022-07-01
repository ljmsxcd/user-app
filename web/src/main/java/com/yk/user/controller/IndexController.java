package com.yk.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: shortUrlCloud
 * @description:
 * @author: DEFAULT
 * @create: 2020-09-02 09:57
 **/
@Controller
public class IndexController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("name", "dalaoyang");
        return "index";
    }


}
