package com.wangkaiping.controller.studentController;
import com.wangkaiping.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



//登录控制器
@Controller
public class LoginController {
    @Autowired
    private StudentService studentServiceImpl;



    @RequestMapping("/login")
    public String loginBtn(Integer status){
        //用户登录
        return "workbean/studentInterface/Home";

    }





}
