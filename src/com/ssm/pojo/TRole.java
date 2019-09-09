package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TRole {
	
	
    public TRole() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TRole(String roleName, String createTimes, Integer status) {
		super();
		this.roleName = roleName;
		this.createTimes = createTimes;
		this.status = status;
	}

	private Integer id;

    private String roleName;

    private Date createTime;
    
    private String createTimes;

    private Date updateTime;

    private String updateTimes;
    
    private Integer status;
}