package com.wangkaiping.domain;

import java.util.Objects;

public class Student {
    private Integer student_id;
    private String student_username;
    private String student_password;
    private String student_img;
    private String student_name;
    private String student_gender;
    private String student_grade;
    private String student_college;
    private String student_education;
    private String student_evaluation;
    private String student_manage;

    public Integer getStudent_id() {
        return student_id;
    }

    public void setStudent_id(Integer student_id) {
        this.student_id = student_id;
    }

    public String getStudent_username() {
        return student_username;
    }

    public void setStudent_username(String student_username) {
        this.student_username = student_username;
    }

    public String getStudent_password() {
        return student_password;
    }

    public void setStudent_password(String student_password) {
        this.student_password = student_password;
    }

    public String getStudent_img() {
        return student_img;
    }

    public void setStudent_img(String student_img) {
        this.student_img = student_img;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getStudent_gender() {
        return student_gender;
    }

    public void setStudent_gender(String student_gender) {
        this.student_gender = student_gender;
    }

    public String getStudent_grade() {
        return student_grade;
    }

    public void setStudent_grade(String student_grade) {
        this.student_grade = student_grade;
    }

    public String getStudent_college() {
        return student_college;
    }

    public void setStudent_college(String student_college) {
        this.student_college = student_college;
    }

    public String getStudent_education() {
        return student_education;
    }

    public void setStudent_education(String student_education) {
        this.student_education = student_education;
    }

    public String getStudent_evaluation() {
        return student_evaluation;
    }

    public void setStudent_evaluation(String student_evaluation) {
        this.student_evaluation = student_evaluation;
    }

    public String getStudent_manage() {
        return student_manage;
    }

    public void setStudent_manage(String student_manage) {
        this.student_manage = student_manage;
    }

    @Override
    public String toString() {
        return "Student{" +
                "student_id=" + student_id +
                ", student_username='" + student_username + '\'' +
                ", student_password='" + student_password + '\'' +
                ", student_img='" + student_img + '\'' +
                ", student_name='" + student_name + '\'' +
                ", student_gender='" + student_gender + '\'' +
                ", student_grade='" + student_grade + '\'' +
                ", student_college='" + student_college + '\'' +
                ", student_education='" + student_education + '\'' +
                ", student_evaluation='" + student_evaluation + '\'' +
                ", student_manage='" + student_manage + '\'' +
                '}';
    }

}
