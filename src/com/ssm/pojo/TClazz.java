package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TClazz {
    private Integer id;

    private String clazzName;

    private Integer userId;

    private Integer status;

    private Date createTime;
    
    private String createTimes;

    private Date updateTime;
}