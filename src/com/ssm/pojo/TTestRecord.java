package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TTestRecord {
    private Integer id;

    private String testName;

    private Integer studentId;

    private Date totalTime;

    private String accuracy;

    private Date createTime;
}