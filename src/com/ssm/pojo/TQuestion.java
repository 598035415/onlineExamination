package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TQuestion {
    private Integer id;

    private Integer questionType;

    private String questionName;

    private Integer questionScore;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    private String remark;

}