package com.ssm.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TLogVo {
    private Integer id;
    
    private String loginIp;

    private String loginName;

    private Integer status;

    private String msg;
    
    private String updatePerson;
    
    private Date createTime;
    
    private Date updateTime;
   
    
    private String createTimeS;
    private String updateTimeS;
 
    
}