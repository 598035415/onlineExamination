package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TExamPaper {
    private Integer id;

    private String examPaperTitle;

    private Integer examPaperTotalScroe;

    private Integer examPaperType;

    private Integer qualifiedPoints;

    private Integer status;

    private Date createTime;
    
    private String createTimes;
   
    private Date updateTime;
    
    private String updateTimes;
}