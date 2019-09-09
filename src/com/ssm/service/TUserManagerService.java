package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TUser;
import com.ssm.util.ResponseEntity;

public interface TUserManagerService {

	List<TUser> queryUserAll();
	
	TUser selectByUserName(String username);
	
	ResponseEntity<TUser> addUser(String username,String gender,String roleId,String pass,String repass,String birthdays);
	
	ResponseEntity<TUser> deleteUser(String id);
}
