package com.wangkaiping.service.impl;

import com.wangkaiping.dao.CommentDao;
import com.wangkaiping.service.CommentService;
import com.wangkaiping.vo.CommentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;

    @Override
    public List<CommentVo> getCommentListByQuestionId(Integer questionId) {
        return commentDao.getCommentListByQuestionId(questionId);
    }
}
