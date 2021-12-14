package com.wangkaiping.domain;

public class Comment {
    private Integer comment_id;
    private String comment_createTime;
    private String comment_content;
    private Integer comment_student_id;
    private String comment_question_id;

    public Integer getComment_id() {
        return comment_id;
    }

    public void setComment_id(Integer comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_createTime() {
        return comment_createTime;
    }

    public void setComment_createTime(String comment_createTime) {
        this.comment_createTime = comment_createTime;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public Integer getComment_student_id() {
        return comment_student_id;
    }

    public void setComment_student_id(Integer comment_student_id) {
        this.comment_student_id = comment_student_id;
    }

    public String getComment_question_id() {
        return comment_question_id;
    }

    public void setComment_question_id(String comment_question_id) {
        this.comment_question_id = comment_question_id;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "comment_id=" + comment_id +
                ", comment_createTime='" + comment_createTime + '\'' +
                ", comment_content='" + comment_content + '\'' +
                ", comment_student_id=" + comment_student_id +
                ", comment_question_id='" + comment_question_id + '\'' +
                '}';
    }
}
