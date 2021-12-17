package com.wangkaiping.controller.manageController;

import com.wangkaiping.domain.Question;
import com.wangkaiping.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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

    //编辑试题按钮跳转到试题编辑界面
    @RequestMapping("/toQuestionEdit")
    public ModelAndView toQuestionEdit(Integer questionId){
        ModelAndView modelAndView = new ModelAndView();
        Question question = questionServiceImpl.getgetQuestionDetailsById(questionId);
        modelAndView.addObject("question",question);
        modelAndView.setViewName("workbean/managerInterface/questionManage/scManage/scQuestionEdit");
        return modelAndView;
    }

    //查看试题的详情信息获取试题内容：
    @RequestMapping("/getQuestionDetailsById")
    public ModelAndView getQuestionDetailsById(Integer questionId){
        ModelAndView modelAndView = new ModelAndView();
        Question question = questionServiceImpl.getgetQuestionDetailsById(questionId);
        modelAndView.addObject("question",question);
        modelAndView.setViewName("workbean/managerInterface/questionManage/scManage/scQuestionDetails");
        return modelAndView;
    }

    //试题编辑的功能
    @RequestMapping("/toEditQuestion")
    public void toEditQuestion(Question question){
        System.out.println("进入到toEditQuestion");
        System.out.println(question);
    }
    //试题编辑的功能
    @RequestMapping("/toEditQuestion2")
    public void toEditQuestion2(HttpServletRequest request){
        System.out.println("进入到toEditQuestion");
        System.out.println(request.getAttribute("name"));
    }
}
