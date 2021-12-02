package com.wangkaiping.vo;
//这是一个选项答题卡类，用于使用者的答案，和标准答案
public class AnswerSheet {
    private String userAnswer;
    private String optionAnswer;

    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
    }

    public String getOptionAnswer() {
        return optionAnswer;
    }

    public void setOptionAnswer(String optionAnswer) {
        this.optionAnswer = optionAnswer;
    }

    @Override
    public String toString() {
        return "AnswerSheet{" +
                "userAnswer='" + userAnswer + '\'' +
                ", optionAnswer='" + optionAnswer + '\'' +
                '}';
    }
}
