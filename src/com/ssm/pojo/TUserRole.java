package com.ssm.pojo;

import lombok.Data;

@Data
public class TUserRole {
    private Integer id;

    public TUserRole(Integer userId, Integer roleId) {
		super();
		this.userId = userId;
		this.roleId = roleId;
	}

	public TUserRole() {
		super();
		// TODO Auto-generated constructor stub
	}

	private Integer userId;

    private Integer roleId;
    
}