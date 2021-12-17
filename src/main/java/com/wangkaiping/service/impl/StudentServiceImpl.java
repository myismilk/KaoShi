package com.wangkaiping.service.impl;

import com.wangkaiping.dao.StudentDao;
import com.wangkaiping.domain.Question;
import com.wangkaiping.domain.Student;
import com.wangkaiping.service.StudentService;
import com.wangkaiping.vo.MistakeVo;
import com.wangkaiping.vo.PaperVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/*@Service(value = "studentServiceImpl")*/
@Service
public class StudentServiceImpl implements StudentService {
    /*@Resource(name = "studentDao")*/
    @Autowired
    private StudentDao studentDao;
    @Override
    public Student findStudentById(Integer studentId) {
        Student student = studentDao.findStudentById(studentId);
        return student;
    }

    @Override
    public Integer getWaitExamNum(Map<String,Object> map) {
        return studentDao.getWaitExamNum(map);
    }

    @Override
    public List<PaperVo> getPaper(Integer studentId) {
        List<PaperVo> paperVoList = studentDao.getPaper(studentId);
        return paperVoList;
    }

    @Override
    public List<Question> getExam(Integer id) {
        List<Question> questionList = studentDao.getExam(id);
        return questionList;
    }

    @Override
    public List<MistakeVo> getMisTake(int studentId) {
        return studentDao.getMisTake(studentId);
    }

    @Override
    public String editEvaluation(Map<String, Object> map) {
        boolean result = false;
        Integer num = studentDao.editEvaluation(map);
        if(num==1){
           return "修改成功";
        }
        return "修改失败";
    }

    @Override
    public Integer editPhoto(Map<String,String> map) {
        return studentDao.editPhoto(map);
    }

    //管理员登录验证
    @Override
    public Map<String, String> studentLogin(Map<String, String> map) {
        return studentDao.studentLogin(map);
    }


}
