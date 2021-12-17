package com.wangkaiping.dao;

import com.wangkaiping.domain.Question;

import java.util.List;

public interface QuestionDao {
    Question getQuestionById(Integer questionId);
    List<Question> getAllScQuestion();

    void editScQuestion(Question question);

    void AddScQuestion(Question question);

    void deleteQuestionById(Integer questionId);

    List<Question> getAllMcQuestion();
}
