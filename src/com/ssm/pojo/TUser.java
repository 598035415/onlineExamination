package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TUser {
    private Integer id;

    private String username;

    private String password;

    private Integer gender;

    private Date birthday;

    private String headPortrait;

    private Integer clazzId;

    private Date createTime;

    private Date updateTime;

    private Date lastLoginTime;

    private Integer status;

    private String salt;
}