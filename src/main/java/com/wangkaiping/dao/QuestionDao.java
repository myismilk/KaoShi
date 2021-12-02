package com.wangkaiping.dao;

import com.wangkaiping.domain.Question;

public interface QuestionDao {
    Question getQuestionById(Integer questionId);
}
