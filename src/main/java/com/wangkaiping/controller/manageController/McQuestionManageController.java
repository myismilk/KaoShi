package com.wangkaiping.controller.manageController;

import com.wangkaiping.domain.Question;
import com.wangkaiping.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class McQuestionManageController {
    @Autowired
    private QuestionService questionServiceImpl;

    //进入多选题题库界面
    @RequestMapping("/toMcManage")
    public ModelAndView toMcManage(){
        System.out.println("进入到了toMcManage");
        ModelAndView modelAndView = new ModelAndView();
        //获取所有的多选题
        List<Question> questionList = questionServiceImpl.getAllMcQuestion();
        modelAndView.addObject("questionList",questionList);
        modelAndView.setViewName("workbean/managerInterface/questionManage/mcManage/mcHome");
        return modelAndView;
    }
}
