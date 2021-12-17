package com.wangkaiping.domain;

public class Question {
    private Integer question_id;
    private String question_type;
    private String question_topic;
    private String question_A;
    private String question_B;
    private String question_C;
    private String question_D;
    private String answer;
    private String parsing;
    private String create_time;
    private String edit_time;
    private String create_by;

    public Integer getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Integer question_id) {
        this.question_id = question_id;
    }

    public String getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(String question_type) {
        this.question_type = question_type;
    }

    public String getQuestion_topic() {
        return question_topic;
    }

    public void setQuestion_topic(String question_topic) {
        this.question_topic = question_topic;
    }

    public String getQuestion_A() {
        return question_A;
    }

    public void setQuestion_A(String question_A) {
        this.question_A = question_A;
    }

    public String getQuestion_B() {
        return question_B;
    }

    public void setQuestion_B(String question_B) {
        this.question_B = question_B;
    }

    public String getQuestion_C() {
        return question_C;
    }

    public void setQuestion_C(String question_C) {
        this.question_C = question_C;
    }

    public String getQuestion_D() {
        return question_D;
    }

    public void setQuestion_D(String question_D) {
        this.question_D = question_D;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getParsing() {
        return parsing;
    }

    public void setParsing(String parsing) {
        this.parsing = parsing;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getEdit_time() {
        return edit_time;
    }

    public void setEdit_time(String edit_time) {
        this.edit_time = edit_time;
    }

    public String getCreate_by() {
        return create_by;
    }

    public void setCreate_by(String create_by) {
        this.create_by = create_by;
    }

    @Override
    public String toString() {
        return "Question{" +
                "question_id=" + question_id +
                ", question_type=" + question_type +
                ", question_topic='" + question_topic + '\'' +
                ", question_A='" + question_A + '\'' +
                ", question_B='" + question_B + '\'' +
                ", question_C='" + question_C + '\'' +
                ", question_D='" + question_D + '\'' +
                ", answer='" + answer + '\'' +
                ", parsing='" + parsing + '\'' +
                ", create_time='" + create_time + '\'' +
                ", edit_time='" + edit_time + '\'' +
                ", create_by=" + create_by +
                '}';
    }
}
