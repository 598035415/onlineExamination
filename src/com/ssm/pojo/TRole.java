package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TRole {
    private Integer id;

    private String roleName;

    private Date createTime;
    
    private String createTimes;

    private Date updateTime;

    private String updateTimes;
    
    private Integer status;
}