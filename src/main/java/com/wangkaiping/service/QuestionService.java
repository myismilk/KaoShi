package com.wangkaiping.service;

import com.wangkaiping.domain.Question;

import java.util.List;

public interface QuestionService {
    Question getQuestionById(Integer question);
    List<Question> getAllScQuestion();

    Question getgetQuestionDetailsById(Integer questionId);
}
