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
    
    private String birthdays;

    private String headPortrait;

    private Integer clazzId;

    private Date createTime;
    
    private String createTimes;

    private Date updateTime;
    
    private String updateTimes;

    private Date lastLoginTime;
    
    private String lastLoginTimes;

    private Integer status;

    private String salt;
}