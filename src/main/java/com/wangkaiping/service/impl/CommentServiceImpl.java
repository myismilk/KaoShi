package com.wangkaiping.service.impl;

import com.wangkaiping.dao.CommentDao;
import com.wangkaiping.domain.Comment;
import com.wangkaiping.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;
    @Override
    public List<Comment> getCommentListByQuestionId(Integer questionId) {
        return null;
    }
}
