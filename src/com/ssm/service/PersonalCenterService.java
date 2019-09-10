package com.ssm.service;

public interface PersonalCenterService {

	String updateHeadPortrait(Integer id, String fileName);
	
	String updatePassword(Integer id, String password);
	
	String updateUser(Integer id, String gender, String birthday);
	
}
