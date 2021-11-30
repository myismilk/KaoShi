package com.wangkaiping.vo;

public class MistakeVo {
    private Integer mistakeId;
    private String question_topic;
    private String question_A;
    private String question_B;
    private String question_C;
    private String question_D;
    private String answer;


    public Integer getMistakeId() {
        return mistakeId;
    }

    public void setMistakeId(Integer mistakeId) {
        this.mistakeId = mistakeId;
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

    @Override
    public String toString() {
        return "MistakeVo{" +
                "mistakeId=" + mistakeId +
                ", question_topic='" + question_topic + '\'' +
                ", question_A='" + question_A + '\'' +
                ", question_B='" + question_B + '\'' +
                ", question_C='" + question_C + '\'' +
                ", question_D='" + question_D + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }
}
