package com.wangkaiping.service;

import com.wangkaiping.domain.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> getCommentListByQuestionId(Integer questionId);
}
