package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TTestRecord {
    private Integer id;

    private String testName;

    private Integer studentId;

    private String totalTime;

    private String accuracy;

    private Date createTime;
}