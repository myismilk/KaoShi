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

    void editMcQuestion(Question question);

    void AddMcQuestion(Question question);

    List<Question> getAllTFQuestion();

    void editTFQuestion();

    void toAddTFQuestion(Question question);
}
