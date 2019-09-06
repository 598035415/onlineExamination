package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TLog {
    private Integer id;

    private Date loginTime;

    private String loginIp;

    private String loginName;

    private Integer status;

    private Date createTime;

}