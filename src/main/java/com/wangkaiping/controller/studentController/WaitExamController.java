package com.wangkaiping.controller.studentController;

import com.wangkaiping.domain.Comment;
import com.wangkaiping.domain.Question;
import com.wangkaiping.service.CommentService;
import com.wangkaiping.service.QuestionService;
import com.wangkaiping.service.StudentService;
import com.wangkaiping.vo.AnswerSheet;
import com.wangkaiping.vo.CommentVo;
import com.wangkaiping.vo.PaperVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class WaitExamController {
    @Autowired
    private StudentService studentServiceImpl;
    @Autowired
    private QuestionService questionServiceImpl;
    @Autowired
    private CommentService CommentServiceImpl;

    //判题方法
    @RequestMapping("/workbean/studentInterface/waitexam/scoring.do")
    public ModelAndView scoring(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        //用来装判题时候用户某题的对错，进行算分
        //修改：Map<Integer,Boolean> resultMap = new HashMap<>();
        Map<Integer, AnswerSheet> answerSheetMap = new HashMap<>();
        int fraction = 0;
        HttpSession session = request.getSession(false);
        List<Question> questionList = (List<Question>) session.getAttribute("questionList");
        for (Question question:questionList) {
            String answer = request.getParameter(String.valueOf(question.getQuestion_id()));
            if(answer.contains("null")){
                answer = "未选择";
            }
            if (answer.equals(question.getAnswer())){
                /*//题目对了
                resultMap.put(question.getQuestion_id(),true);
                fraction += 10;*/

                /*----------------------------修改*/
                AnswerSheet answerSheet = new AnswerSheet();
                answerSheet.setUserAnswer(answer);
                answerSheet.setOptionAnswer(question.getAnswer());
                answerSheetMap.put(question.getQuestion_id(),answerSheet);
                fraction += 10;
            }else{
                /*//这里进行错题操作
                resultMap.put(question.getQuestion_id(),false);
                //将数据库添加错题 mistake*/

                /*----------------------------修改*/
                AnswerSheet answerSheet = new AnswerSheet();
                answerSheet.setUserAnswer(answer);
                answerSheet.setOptionAnswer(question.getAnswer());
                answerSheetMap.put(question.getQuestion_id(),answerSheet);

            }
        }
        modelAndView.addObject("fraction",fraction);
        modelAndView.addObject("answerSheetMap",answerSheetMap);
        modelAndView.setViewName("workbean/studentInterface/waitexam/examResult");
        return modelAndView;
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
        ArrayList<Question> questionList = (ArrayList<Question>) studentServiceImpl.getExam(id);
        HttpSession session = request.getSession(false);
        session.setAttribute("questionList",questionList);
        modelAndView.addObject("questionList",questionList);
        modelAndView.setViewName("workbean/studentInterface/waitexam/examPage");
        return modelAndView;
    }

    //获取试题的详情
    @RequestMapping("/workbean/studentInterface/waitexam/getQuestionDetails")
    public ModelAndView getQuestionDetails(Integer questionId,String userAnswer){
        ModelAndView modelAndView = new ModelAndView();
        //获取question用于展示题目，和用户的选项。
        Question question = questionServiceImpl.getQuestionById(questionId);
        modelAndView.addObject("question",question);
        modelAndView.addObject("userAnswer",userAnswer);
        //获取该题目的相关所有评论
        List<CommentVo> commentVoList = CommentServiceImpl.getCommentListByQuestionId(questionId);
        for(CommentVo commentVo:commentVoList){
            System.out.println(commentVo);
        }
        modelAndView.addObject("commentVoList",commentVoList);
       // 跳转
        modelAndView.setViewName("workbean/studentInterface/waitexam/questionParsing");
        return modelAndView;
    }



}
