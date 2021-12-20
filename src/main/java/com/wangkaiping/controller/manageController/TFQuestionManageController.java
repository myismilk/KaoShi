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
public class TFQuestionManageController {
    @Autowired
    private QuestionService questionServiceImpl;
    //进入判断题题库界面
    @RequestMapping("/toTFManage")
    public ModelAndView toTFManage(){
        ModelAndView modelAndView = new ModelAndView();
        //获取所有的判断题
        List<Question> questionList = questionServiceImpl.getAllTFQuestion();
        modelAndView.addObject("questionList",questionList);
        modelAndView.setViewName("workbean/managerInterface/questionManage/tfManage/tfHome");
        return modelAndView;
    }
    //编辑多选试题按钮跳转到试题编辑界面
    @RequestMapping("/toTFQuestionEdit")
    public ModelAndView toTFQuestionEdit(Integer questionId){
        ModelAndView modelAndView = new ModelAndView();
        //获取到这个判断题
        Question question = questionServiceImpl.getgetQuestionDetailsById(questionId);
        modelAndView.addObject("question",question);
        modelAndView.setViewName("workbean/managerInterface/questionManage/tfManage/tfQuestionEdit");
        return modelAndView;
    }
    //判断试题编辑的功能
    @RequestMapping("/toEditTFQuestion")
    public String toEditTFQuestion(Question question){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String edit_time = sdf.format(new Date());
        question.setEdit_time(edit_time);
        questionServiceImpl.editTFQuestion(question);
        return "redirect:toTFManage";
    }
    //删除判断题
    @RequestMapping("/toDeleteTFQuestion")
    public String toDeleteTFQuestion(Integer questionId){
        questionServiceImpl.deleteQuestionById(questionId);
        return "redirect:toTFManage";
    }

    //查看判断试题的详情信息获取试题内容：
    @RequestMapping("/getTFQuestionDetailsById")
    public ModelAndView getTFQuestionDetailsById(Integer questionId){
        ModelAndView modelAndView = new ModelAndView();
        Question question = questionServiceImpl.getgetQuestionDetailsById(questionId);
        modelAndView.addObject("question",question);
        modelAndView.setViewName("workbean/managerInterface/questionManage/tfManage/tfQuestionDetails");
        return modelAndView;
    }

    //跳转添加判断试题的界面
    @RequestMapping("/toAddTFQuestionInterface")
    public String toAddTFQuestionInterface(){
        return "workbean/managerInterface/questionManage/tfManage/tfQuestionAdd";
    }
    //判断试题添加功能
    @RequestMapping("/toAddTFQuestion")
    public String toAddTFQuestion(Question question){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String create_time = sdf.format(new Date());
        question.setCreate_time(create_time);
        questionServiceImpl.toAddTFQuestion(question);
        return "redirect:toTFManage";
    }

}
