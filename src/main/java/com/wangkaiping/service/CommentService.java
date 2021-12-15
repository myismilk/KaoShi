package com.wangkaiping.service;

import com.wangkaiping.domain.Comment;
import com.wangkaiping.vo.CommentVo;

import java.util.List;

public interface CommentService {
    List<CommentVo> getCommentListByQuestionId(Integer questionId);
}
