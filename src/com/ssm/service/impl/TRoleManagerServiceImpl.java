package com.ssm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.TRoleMapper;
import com.ssm.pojo.TRole;
import com.ssm.service.TRoleManagerService;
import com.ssm.util.ResponseEntity;

@Service
public class TRoleManagerServiceImpl implements TRoleManagerService{

	@Autowired
	private TRoleMapper dao;

	@Override
	public List<TRole> selectAllRole() {
		return dao.selectAllRole();
	}

	@Transactional
	@Override
	public ResponseEntity<TRole> addRole(String[] menuIds, String roleName) {
		ResponseEntity<TRole> entity = new ResponseEntity<TRole>();

		 Integer addRole = dao.addRole(new TRole(roleName,new Date().toLocaleString(),1));
		 
		 TRole role = dao.selectByRoleName(roleName);
		 
		 for (int i = 0; i < menuIds.length; i++) {
			dao.addRoleMenu(menuIds[i], ""+role.getId());
		}
		 entity.setCode("200");
		 entity.setMsg("增加成功");
		return entity;
	}

}
