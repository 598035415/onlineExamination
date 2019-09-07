package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TUserMapper;
import com.ssm.pojo.TUser;
import com.ssm.service.TUserManagerService;

@Service
public class TUserManagerServiceImpl implements TUserManagerService{
	@Autowired
	private TUserMapper dao ;

	@Override
	public List<TUser> queryUserAll() {
		return dao.queryUserAll();
	}
	
	
}
