package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TDict {
    private Integer id;

    private String label;

    private String value;

    private String type;

    private Integer sort;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    private String updatePerson;

}