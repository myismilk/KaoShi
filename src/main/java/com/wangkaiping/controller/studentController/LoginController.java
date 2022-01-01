package com.wangkaiping.controller.studentController;
import com.wangkaiping.domain.Student;
import com.wangkaiping.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


//登录控制器
@Controller
public class LoginController {
    @Autowired
    private StudentService studentServiceImpl;



    @RequestMapping("/login")
    public String loginBtn(Integer status, HttpServletRequest request){
        //用户登录
        Student student = new Student();
        request.getSession().setAttribute("user",student);
        return "workbean/studentInterface/Home";

    }





}
