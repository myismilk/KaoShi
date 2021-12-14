package com.wangkaiping.service;

import com.wangkaiping.domain.Question;
import com.wangkaiping.domain.Student;
import com.wangkaiping.vo.MistakeVo;
import com.wangkaiping.vo.PaperVo;

import java.util.List;
import java.util.Map;

public interface StudentService {
    Student findStudentById(Integer studentId);

    Integer getWaitExamNum(Map<String,Object> map);

    List<PaperVo> getPaper(Integer studentId);

    List<Question> getExam(Integer id);

    List<MistakeVo> getMisTake(int i);

    String editEvaluation(Map<String, Object> map);

    Integer editPhoto(Map<String,String> map);
}
