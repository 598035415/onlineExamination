package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TRole {
    private Integer id;

    private String roleName;

    private Date createTime;

    private Date updateTime;

    private Integer status;
}