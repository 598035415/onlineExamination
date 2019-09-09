package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TUser {
	
    public TUser() {
		super();
	}

	public TUser(String username, String password, Integer gender, String birthdays, String createTimes,
			Integer status) {
		super();
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.birthdays = birthdays;
		this.createTimes = createTimes;
		this.status = status;
	}

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