package com.wangkaiping.dao;

import com.wangkaiping.vo.CommentVo;

import java.util.List;

public interface CommentDao {
    List<CommentVo> getCommentListByQuestionId(Integer questionId);
}
