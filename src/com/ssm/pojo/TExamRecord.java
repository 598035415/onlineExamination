package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TExamRecord {
    private Integer id;

    private Integer examPulishId;

    private Integer studentId;

    private Integer score;

    private Date createTime;

    private Integer status;

}