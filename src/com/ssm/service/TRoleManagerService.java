package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TRole;
import com.ssm.util.ResponseEntity;

public interface TRoleManagerService {
	List<TRole> selectAllRole();
	
	ResponseEntity<TRole> addRole(String [] menuIds,String roleName);
	
	ResponseEntity<TRole>  deleteRole(String Id);
	
}
