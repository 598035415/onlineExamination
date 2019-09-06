package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TUserMapper;
import com.ssm.pojo.TUser;
import com.ssm.service.TUserService;
import com.ssm.util.ResponseEntity;

@Service
public class TUserServiceImpl implements TUserService {

	@Autowired
	private TUserMapper dao;
	
	private ResponseEntity<TUser> entity = new ResponseEntity<TUser>();
	
	@Override
	public ResponseEntity<TUser> backgroundLogin(String username, String password) {
		if(null==username||"".equals(username)) {
			entity.setCode("484");
			entity.setMsg("账号不能为空");
			return entity;
		}
		if(null==password||"".equals(password)) {
			entity.setCode("484");
			entity.setMsg("密码不能为空");
			return entity;
		}
		TUser user = dao.backgroundLogin(username, password);
		
		if(user==null||"".equals(user.getUsername())) {
			entity.setCode("484");
			entity.setMsg("账号或密码错误");
			return entity;
		}
		entity.setCode("200");
		entity.setData(user);
		entity.setMsg("登录成功");
		entity.setCount(1L);
		return entity;
	}

	@Override
	public ResponseEntity<TUser> frontDeskLogin(String username, String password) {
		if (null != username && null != password) {
			TUser user = dao.frontDeskLogin(username, password);
			if (null != user) {
				entity.setCode("200");
				entity.setData(user);
				entity.setMsg("登录成功");
				entity.setCount(1L);
				return entity;
			}
		}
		entity.setCode("484");
		entity.setMsg("用户名或密码错误");
		return entity;
	}
	
	
}
