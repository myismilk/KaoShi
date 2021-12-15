package com.wangkaiping.vo;
//用于展示评论的Vo对象
public class CommentVo {
    private String commentStudent;
    private String commentCreateTime;
    private String commentContent;

    public String getCommentStudent() {
        return commentStudent;
    }

    public void setCommentStudent(String commentStudent) {
        this.commentStudent = commentStudent;
    }

    public String getCommentCreateTime() {
        return commentCreateTime;
    }

    public void setCommentCreateTime(String commentCreateTime) {
        this.commentCreateTime = commentCreateTime;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    @Override
    public String toString() {
        return "CommentVo{" +
                "commentStudent='" + commentStudent + '\'' +
                ", commentCreateTime='" + commentCreateTime + '\'' +
                ", commentContent='" + commentContent + '\'' +
                '}';
    }
}
