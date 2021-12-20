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
public class McQuestionManageController {
    @Autowired
    private QuestionService questionServiceImpl;

    //进入多选题题库界面
    @RequestMapping("/toMcManage")
    public ModelAndView toMcManage(){
        ModelAndView modelAndView = new ModelAndView();
        //获取所有的多选题
        List<Question> questionList = questionServiceImpl.getAllMcQuestion();
        modelAndView.addObject("questionList",questionList);
        modelAndView.setViewName("workbean/managerInterface/questionManage/mcManage/mcHome");
        return modelAndView;
    }
    //编辑多选试题按钮跳转到试题编辑界面
    @RequestMapping("/toMcQuestionEdit")
    public ModelAndView toMcQuestionEdit(Integer questionId){
        ModelAndView modelAndView = new ModelAndView();
        //获取到这个多选题
        Question question = questionServiceImpl.getgetQuestionDetailsById(questionId);
        modelAndView.addObject("question",question);
        modelAndView.setViewName("workbean/managerInterface/questionManage/mcManage/mcQuestionEdit");
        return modelAndView;
    }

    //多选试题编辑的功能
    @RequestMapping("/toEditMcQuestion")
    public String toEditMcQuestion(Question question){
        System.out.println("进入到toEditMcQuestion");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String edit_time = sdf.format(new Date());
        question.setEdit_time(edit_time);
        questionServiceImpl.editMcQuestion(question);
        System.out.println("修改完毕");
        return "redirect:toMcManage";
    }

    //删除多选题
    @RequestMapping("/toDeleteMcQuestion")
    public String toDeleteScQuestion(Integer questionId){
        questionServiceImpl.deleteQuestionById(questionId);
        return "redirect:toMcManage";
    }

    //查看多选试题的详情信息获取试题内容：
    @RequestMapping("/getMcQuestionDetailsById")
    public ModelAndView getMcQuestionDetailsById(Integer questionId){
        ModelAndView modelAndView = new ModelAndView();
        Question question = questionServiceImpl.getgetQuestionDetailsById(questionId);
        modelAndView.addObject("question",question);
        modelAndView.setViewName("workbean/managerInterface/questionManage/mcManage/mcQuestionDetails");
        return modelAndView;
    }


    //跳转添加多选试题的界面
    @RequestMapping("/toAddMcQuestionInterface")
    public String toAddMcQuestion(){
        return "workbean/managerInterface/questionManage/mcManage/mcQuestionAdd";
    }
    //多选试题添加功能
    @RequestMapping("/toAddMcQuestion")
    public String toAddMcQuestion(Question question){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String create_time = sdf.format(new Date());
        question.setCreate_time(create_time);
        questionServiceImpl.AddMcQuestion(question);
        return "redirect:toMcManage";
    }



}
