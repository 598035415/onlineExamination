package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TLog {
    private Integer id;

    private String msg;

    private String loginIp;

    private String loginName;

    private Integer status;

    private Date createTime;
    
    private Date updateTime;
    
    private String update_person;

}