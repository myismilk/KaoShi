package com.wangkaiping.service;

import com.wangkaiping.domain.Question;

import java.util.List;

public interface QuestionService {
    Question getQuestionById(Integer question);
    List<Question> getAllScQuestion();

    Question getgetQuestionDetailsById(Integer questionId);

    void editScQuestion(Question question);

    void AddScQuestion(Question question);

    void deleteQuestionById(Integer questionId);

    List<Question> getAllMcQuestion();

    void editMcQuestion(Question question);

    void AddMcQuestion(Question question);

    List<Question> getAllTFQuestion();

    void editTFQuestion(Question question);

    void toAddTFQuestion(Question question);
}
