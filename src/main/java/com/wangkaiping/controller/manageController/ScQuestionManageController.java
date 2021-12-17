package com.wangkaiping.controller.manageController;

import com.wangkaiping.domain.Question;
import com.wangkaiping.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ScQuestionManageController {
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

    //编辑单选试题按钮跳转到试题编辑界面
    @RequestMapping("/toQuestionEdit")
    public ModelAndView toQuestionEdit(Integer questionId){
        ModelAndView modelAndView = new ModelAndView();
        Question question = questionServiceImpl.getgetQuestionDetailsById(questionId);
        modelAndView.addObject("question",question);
        modelAndView.setViewName("workbean/managerInterface/questionManage/scManage/scQuestionEdit");
        return modelAndView;
    }

    //查看单选试题的详情信息获取试题内容：
    @RequestMapping("/getQuestionDetailsById")
    public ModelAndView getQuestionDetailsById(Integer questionId){
        ModelAndView modelAndView = new ModelAndView();
        Question question = questionServiceImpl.getgetQuestionDetailsById(questionId);
        modelAndView.addObject("question",question);
        modelAndView.setViewName("workbean/managerInterface/questionManage/scManage/scQuestionDetails");
        return modelAndView;
    }

    //单选试题编辑的功能
    @RequestMapping("/toEditQuestion")
    public String toEditQuestion(Question question){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String edit_time = sdf.format(new Date());
        question.setEdit_time(edit_time);
        questionServiceImpl.editScQuestion(question);
        return "redirect:toScManage";
    }

    //跳转添加单选试题的界面
    @RequestMapping("/toAddScQuestionInterface")
    public String toAddScQuestion(){
        return "workbean/managerInterface/questionManage/scManage/scQuestionAdd";
    }
    //单选试题添加功能
    @RequestMapping("/toAddScQuestion")
    public String toAddScQuestion(Question question){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String create_time = sdf.format(new Date());
        question.setCreate_time(create_time);
        questionServiceImpl.AddScQuestion(question);
        return "redirect:toScManage";
    }


    //删除单选题
    @RequestMapping("/toDeleteScQuestion")
    public String toDeleteScQuestion(Integer questionId){
        questionServiceImpl.deleteQuestionById(questionId);
        return "redirect:toScManage";
    }


}
