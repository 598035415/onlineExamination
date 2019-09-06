package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TClazzCate {
    private Integer id;

    private String clazzTypeName;

    private Integer sort;

    private Integer parentId;

    private Integer status;

    private Date createTime;

    private Date updateTime;

}