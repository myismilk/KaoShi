package com.wangkaiping.domain;

public class Manage {
    private Integer manage_id;
    private String manage_name;
    private String manage_username;
    private String manage_password;
    private String manage_img;
    private String manage_college;

    public Integer getManage_id() {
        return manage_id;
    }

    public void setManage_id(Integer manage_id) {
        this.manage_id = manage_id;
    }

    public String getManage_name() {
        return manage_name;
    }

    public void setManage_name(String manage_name) {
        this.manage_name = manage_name;
    }

    public String getManage_username() {
        return manage_username;
    }

    public void setManage_username(String manage_username) {
        this.manage_username = manage_username;
    }

    public String getManage_password() {
        return manage_password;
    }

    public void setManage_password(String manage_password) {
        this.manage_password = manage_password;
    }

    public String getManage_img() {
        return manage_img;
    }

    public void setManage_img(String manage_img) {
        this.manage_img = manage_img;
    }

    public String getManage_college() {
        return manage_college;
    }

    public void setManage_college(String manage_college) {
        this.manage_college = manage_college;
    }

    @Override
    public String toString() {
        return "Manage{" +
                "manage_id=" + manage_id +
                ", manage_name='" + manage_name + '\'' +
                ", manage_username='" + manage_username + '\'' +
                ", manage_password='" + manage_password + '\'' +
                ", manage_img='" + manage_img + '\'' +
                ", manage_college='" + manage_college + '\'' +
                '}';
    }
}
