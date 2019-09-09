package com.ssm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.TUserMapper;
import com.ssm.dao.TUserRoleMapper;
import com.ssm.pojo.TUser;
import com.ssm.pojo.TUserRole;
import com.ssm.service.TUserManagerService;
import com.ssm.util.ResponseEntity;

@Service
public class TUserManagerServiceImpl implements TUserManagerService{
	@Autowired
	private TUserMapper dao ;
	
	@Autowired
	private TUserRoleMapper urdao;

	@Override
	public List<TUser> queryUserAll() {
		return dao.queryUserAll();
	}

	@Override
	public TUser selectByUserName(String username) {
		return dao.selectByUserName(username);
	}
	
	
	public ResponseEntity<TUser> addUser(){
		
		
		return null;
	}

	@Transactional
	@Override
	public ResponseEntity<TUser> addUser(String username, String gender, String roleId, String pass, String repass,String birthdays) {
		ResponseEntity<TUser> entity = new ResponseEntity<TUser>();
		if(null==username||"".equals(username)) {
			entity.setCode("484");
			entity.setMsg("账号不能为空");
			return entity;
		}
		if(null==pass||"".equals(pass)||null==repass||"".equals(repass)||pass.length()<5||repass.length()<5) {
			entity.setCode("484");
			entity.setMsg("密码或者确认密码格式不正确");
			return entity;
		}
		if(!pass.equals(repass)) {
			entity.setCode("484");
			entity.setMsg("两次密码不一致");
			return entity;
		}
		
		//判断用户名是否存在
		TUser u = selectByUserName(username);
		if(u!=null) {
			entity.setCode("484");
			entity.setMsg("用户名已存在");
			return entity;
		}
		
		Integer addUser = dao.addUser(new TUser(username,pass,Integer.parseInt(gender),birthdays,new Date().toLocaleString(),1));
		
		TUser us = selectByUserName(username);
		
		
		Integer addTuserMenu = urdao.addTuserMenu(new TUserRole(us.getId(),Integer.parseInt(roleId)));
		
		
		if(addUser==0||addTuserMenu==0) {
			entity.setCode("484");
			entity.setMsg("添加失败");
			return entity;
		}
		entity.setCode("200");
		entity.setMsg("添加成功");
		
		return entity; 
	}
}
