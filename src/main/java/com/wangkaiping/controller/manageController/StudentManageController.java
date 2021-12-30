package com.wangkaiping.controller.manageController;

import com.wangkaiping.domain.Manage;
import com.wangkaiping.domain.Student;
import com.wangkaiping.service.ManageService;
import com.wangkaiping.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class StudentManageController {
    @Autowired
    private ManageService manageService;
    @Autowired
    private StudentService studentService;

    //进入用户管理界面
    @RequestMapping("/toStudentManageInterface")
    public ModelAndView toStudentManageInterface(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        Manage manage = (Manage) request.getSession(false).getAttribute("user");
        List<Student> studentList = manageService.findAllStudentByManageId(manage.getManage_id());
        modelAndView.addObject("studentList",studentList);
        modelAndView.setViewName("workbean/managerInterface/studentManage/studentManage");
        return modelAndView;
    }


    //查看学生详情
    @RequestMapping("/toCheckStudentDetails/{studentId}")
    public ModelAndView toCheckStudentDetails(@PathVariable("studentId") Integer studentId){
        ModelAndView modelAndView = new ModelAndView();
        Student student = studentService.findStudentById(studentId);
        modelAndView.addObject("student",student);
        modelAndView.setViewName("workbean/managerInterface/studentManage/studentDeatils");
        return modelAndView;
    }

}
