package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TUserMapper;
import com.ssm.pojo.TUser;
import com.ssm.service.TUserService;

@Service
public class TUserServiceMapper implements TUserService {

	@Autowired
	private TUserMapper dao;
	
	@Override
	public TUser backgroundLogin(String username, String password) {
		if(null!=username&&"".equals(username)) {
			
			
		}
		return null;
	}
}
