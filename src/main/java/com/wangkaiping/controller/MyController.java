package com.wangkaiping.controller;

import com.wangkaiping.domain.Question;
import com.wangkaiping.domain.Student;
import com.wangkaiping.service.StudentService;
import com.wangkaiping.vo.MistakeVo;
import com.wangkaiping.vo.PaperVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class MyController {
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

    //获取用户的所有试卷
    @RequestMapping("/workbean/waitexam/getPaper.do")
    public @ResponseBody
    List<PaperVo> getPaper(HttpServletRequest request){
        List<PaperVo> paperVoList = studentServiceImpl.getPaper(Integer.valueOf(request.getParameter("studentId")));
        return paperVoList;
    }

    //获取试卷内容
    @RequestMapping("/studentInterface/getExam.do")
    public ModelAndView getExam(Integer id,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        List<Question> questionList = studentServiceImpl.getExam(id);
        HttpSession session = request.getSession(false);
        session.setAttribute("questionList",questionList);
        modelAndView.addObject("questionList",questionList);
        modelAndView.setViewName("workbean/studentInterface/waitexam/examPage");
        return modelAndView;
    }

    //判题方法
    @RequestMapping("/workbean/studentInterface/waitexam/scoring.do")
    public ModelAndView scoring(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        Map<Integer,Boolean> resultMap = new HashMap<>();
        int fraction = 0;
        HttpSession session = request.getSession(false);
        List<Question> questionList = (List<Question>) session.getAttribute("questionList");
        for (Question question:questionList) {
            String answer = request.getParameter(String.valueOf(question.getQuestion_id()));
            if (answer.equals(question.getAnswer())){
                resultMap.put(question.getQuestion_id(),true);
                fraction += 10;
            }else{
                //这里进行错题操作
                resultMap.put(question.getQuestion_id(),false);

                //将数据库添加错题 mistake


            }
        }
        modelAndView.addObject("fraction",fraction);
        modelAndView.addObject("resultMap",resultMap);
        modelAndView.setViewName("workbean/studentInterface/waitexam/examResult");
        return modelAndView;
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


    //修改个人的自我评价
    @RequestMapping(value = "/workbean/studentInterface/self/editEvaluation.do",produces = {"text/plain;charset=utf-8"})
    public @ResponseBody String editEvaluation(HttpServletRequest request) {
        String context = request.getParameter("context");
        Integer studengId = Integer.valueOf(request.getParameter("studentId"));
        Map<String,Object> map = new HashMap<>();
        map.put("context",context);
        map.put("studentId",studengId);
        String result = studentServiceImpl.editEvaluation(map);
        return result;
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
}
