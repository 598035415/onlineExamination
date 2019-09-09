package com.ssm.service;

import com.ssm.pojo.TUser;
import com.ssm.util.ResponseEntity;

public interface TUserService {
	 ResponseEntity<TUser> backgroundLogin(String username,String password);
	 ResponseEntity<TUser> frontDeskLogin(String username,String password);
	 Integer lastLoginTime(Integer id);
	 TUser selectByUserName(String username);
}
