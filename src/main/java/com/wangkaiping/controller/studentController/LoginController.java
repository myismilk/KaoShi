package com.wangkaiping.controller.studentController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//登录控制器
@Controller
public class LoginController {
    @RequestMapping("/login")
    public String loginBtn(){

        //用户登录
        return "workbean/studentInterface/Home";



        //管理员登录
    }

}
