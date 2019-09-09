package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TRoleMapper;
import com.ssm.pojo.TRole;
import com.ssm.service.TRoleManagerService;

@Service
public class TRoleManagerServiceImpl implements TRoleManagerService{

	@Autowired
	private TRoleMapper dao;

	@Override
	public List<TRole> selectAllRole() {
		return dao.selectAllRole();
	}
	

}
