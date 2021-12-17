package com.wangkaiping.service.impl;

import com.wangkaiping.dao.QuestionDao;
import com.wangkaiping.domain.Question;
import com.wangkaiping.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionDao questionDao;
    @Override
    public Question getQuestionById(Integer questionId) {
        return questionDao.getQuestionById(questionId);
    }

    @Override
    public List<Question> getAllScQuestion() {
        return questionDao.getAllScQuestion();
    }

    @Override
    public Question getgetQuestionDetailsById(Integer questionId) {
        return questionDao.getQuestionById(questionId);
    }

    @Override
    public void editScQuestion(Question question) {
        questionDao.editScQuestion(question);
    }

    @Override
    public void AddScQuestion(Question question) {
        questionDao.AddScQuestion(question);
    }

    @Override
    public void deleteQuestionById(Integer questionId) {
        questionDao.deleteQuestionById(questionId);
    }

    @Override
    public List<Question> getAllMcQuestion() {
        return questionDao.getAllMcQuestion();
    }
}
