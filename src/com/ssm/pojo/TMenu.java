package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TMenu {
    private Integer id;

    private String menuName;

    private String url;

    private Integer parentId;

    private Date createTime;

    private Date updateTime;

    private Integer status;

}