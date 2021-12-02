package com.wangkaiping.domain;

public class Question {
    private Integer question_id;
    private String question_topic;
    private String question_A;
    private String question_B;
    private String question_C;
    private String question_D;
    private String answer;
    private String parsing;
    private Integer create_by;

    public Integer getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(Integer question_id) {
        this.question_id = question_id;
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

    public Integer getCreate_by() {
        return create_by;
    }

    public void setCreate_by(Integer create_by) {
        this.create_by = create_by;
    }

    public String getParsing() {
        return parsing;
    }

    public void setParsing(String parsing) {
        this.parsing = parsing;
    }

    @Override
    public String toString() {
        return "Question{" +
                "question_id=" + question_id +
                ", question_topic='" + question_topic + '\'' +
                ", question_A='" + question_A + '\'' +
                ", question_B='" + question_B + '\'' +
                ", question_C='" + question_C + '\'' +
                ", question_D='" + question_D + '\'' +
                ", answer='" + answer + '\'' +
                ", parsing='" + parsing + '\'' +
                ", create_by=" + create_by +
                '}';
    }
}
