package com.wangkaiping.controller.manageController;

import com.wangkaiping.domain.Manage;
import com.wangkaiping.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class ManageOtherController {
    @Autowired
    private ManageService manageServiceImpl;


    //前往管理员登录入口
    @RequestMapping("/managerLogin")
    public String managerLogin(){
        return "workbean/managerInterface/Login";
    }
    //管理员登录验证
    @RequestMapping(value = "/managerLoginVerify",produces = "text/plain;charset=utf-8")
    public @ResponseBody
    String managerLoginVerify(String username, String password, HttpServletRequest request){
        Map<String,String> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        Manage manage =  manageServiceImpl.loginManage(map);
        if(manage!=null){
            request.getSession().setAttribute("user",manage);
            return "true";
        }
        return "false";
    }

    //进入管理员主页
    @RequestMapping("/toManageHome")
    public String toManageHome(){
        return "workbean/managerInterface/Home";
    }
}
