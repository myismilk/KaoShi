package com.wangkaiping.controller.manageController;

import com.wangkaiping.domain.Question;
import com.wangkaiping.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class QuestionManageController {
    @Autowired
    private QuestionService questionServiceImpl;

    //进入单选题题库界面
    @RequestMapping("/toScManage")
    public ModelAndView toScManage(){
        ModelAndView modelAndView = new ModelAndView();
        //获取所有的单选题
        List<Question> questionList = questionServiceImpl.getAllScQuestion();
        modelAndView.addObject("questionList",questionList);
        modelAndView.setViewName("workbean/managerInterface/questionManage/scManage/scHome");
        return modelAndView;
    }

    //获取试题的详情信息：
    @RequestMapping("/getQuestionDetailsById")
    public ModelAndView getQuestionDetailsById(Integer questionId){
        ModelAndView modelAndView = new ModelAndView();
        Question question = questionServiceImpl.getgetQuestionDetailsById(questionId);
        modelAndView.addObject("question",question);
        return modelAndView;
    }

}
