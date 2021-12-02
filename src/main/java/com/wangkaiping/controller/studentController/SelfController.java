package com.wangkaiping.controller.studentController;

import com.wangkaiping.domain.Student;
import com.wangkaiping.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class SelfController {
    @Autowired
    private StudentService studentServiceImpl;


    //查看学生个人信息
    @RequestMapping("/workbean/self/studentMessage.do")
    public ModelAndView getStudentMessage() {
        ModelAndView mav = new ModelAndView();
        Student student = studentServiceImpl.findStudentById(20180001);
        System.out.println(student);
        mav.addObject("student",student);
        mav.setViewName("workbean/studentInterface/self/mySelf");
        return mav;
    }


    //修改个人的自我评价
    @RequestMapping(value = "/workbean/studentInterface/self/editEvaluation.do",produces = {"text/plain;charset=utf-8"})
    public @ResponseBody
    String editEvaluation(HttpServletRequest request) {
        String context = request.getParameter("context");
        Integer studengId = Integer.valueOf(request.getParameter("studentId"));
        Map<String,Object> map = new HashMap<>();
        map.put("context",context);
        map.put("studentId",studengId);
        String result = studentServiceImpl.editEvaluation(map);
        return result;
    }
}
