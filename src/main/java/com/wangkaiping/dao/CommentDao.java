package com.wangkaiping.dao;

import com.wangkaiping.domain.Comment;

import java.util.List;

public interface CommentDao {
    List<Comment> getCommentListByQuestionId(Integer questionId);
}
