package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TStudentExamAnswer {
    private Integer id;

    private Integer examPulishId;

    private Integer studentId;

    private Integer questionId;

    private Integer myAnswer;

    private Integer status;

    private Date createTime;

    private Date updateTime;
}