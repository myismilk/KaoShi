package com.wangkaiping.vo;

public class PaperVo {
    private Integer paperId;
    private String paperName;
    private String paperStartTime;
    private String paperEndTime;
    private String manage;
    private Integer state;

    public Integer getPaperId() {
        return paperId;
    }

    public void setPaperId(Integer paperId) {
        this.paperId = paperId;
    }

    public String getPaperName() {
        return paperName;
    }

    public void setPaperName(String paperName) {
        this.paperName = paperName;
    }

    public String getPaperStartTime() {
        return paperStartTime;
    }

    public void setPaperStartTime(String paperStartTime) {
        this.paperStartTime = paperStartTime;
    }

    public String getPaperEndTime() {
        return paperEndTime;
    }

    public void setPaperEndTime(String paperEndTime) {
        this.paperEndTime = paperEndTime;
    }

    public String getManage() {
        return manage;
    }

    public void setManage(String manage) {
        this.manage = manage;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "PaperVo{" +
                "paperId=" + paperId +
                ", paperName='" + paperName + '\'' +
                ", paperStartTime='" + paperStartTime + '\'' +
                ", paperEndTime='" + paperEndTime + '\'' +
                ", manage='" + manage + '\'' +
                ", state=" + state +
                '}';
    }
}
