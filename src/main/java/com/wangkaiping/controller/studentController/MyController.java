package com.wangkaiping.controller.studentController;

import com.wangkaiping.domain.Question;
import com.wangkaiping.service.QuestionService;
import com.wangkaiping.service.StudentService;
import com.wangkaiping.vo.MistakeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
public class MyController {
    @Autowired
    private StudentService studentServiceImpl;
    @Autowired
    private QuestionService questionServiceImpl;
    //获取待考通知上未完成的试卷数量
    @RequestMapping("/getWaitExamNum.do")
    public @ResponseBody Integer getWaitExamNum(){
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        //获取当前时间
        String date = sdf.format(new Date());
        //用户的id
        Integer studentId = 20180001;
        Map<String,Object> map = new HashMap<>();
        map.put("studentId",studentId);
        map.put("newDate",date);
        Integer result = studentServiceImpl.getWaitExamNum(map);
        return result;
    }
    //跳转到错题回顾
    @RequestMapping("/workbean/studentInterface/mistake/mistake.do")
    public ModelAndView toMisTake(){
        ModelAndView modelAndView = new ModelAndView();
        List<MistakeVo> mistakeVoList = studentServiceImpl.getMisTake(20180001);
        for(MistakeVo mistakeVo:mistakeVoList){
            System.out.println(mistakeVo);
        }
        modelAndView.addObject("mistakeVoList",mistakeVoList);
        modelAndView.setViewName("workbean/studentInterface/mistake/mistake");
        return modelAndView;
    }

    //查看详情
    @RequestMapping("/getQuestionById.do")
    public ModelAndView getOption(Integer questionId,String userAnswer){
        System.out.println(userAnswer);
        ModelAndView modelAndView = new ModelAndView();
        Question question = questionServiceImpl.getQuestionById(questionId);
        modelAndView.addObject("question",question);
        modelAndView.setViewName("workbean/studentInterface/waitexam/questionParsing");
        return modelAndView;
    }

    //跳转到考试通知
    @RequestMapping("/kaoShiNotify.do")
    public String kaoShiNotify(){
        return "workbean/studentInterface/notify/kaoshinotify";
    }
    //跳转到等待考试
    @RequestMapping("/waitExam.do")
    public String waitExam(){
        return "workbean/studentInterface/waitexam/examhome";
    }


    //登录到学生界面的时的上方frame
    @RequestMapping("/top")
    public String studentTopInterface(){
        return "workbean/studentInterface/top";
    }

    //登录到学生界面的时的左方frame
    @RequestMapping("/left")
    public String studentLeftInterface(){
        return "workbean/studentInterface/left";
    }
}
