package com.ssm.service;

import java.util.Map;

public interface PersonalCenterService {

	String updateHeadPortrait(Integer id, String fileName);
	
	String updatePassword(Integer id, String password);
	
	String updateUser(Integer id, String gender, String birthday);

	Map<String, Object> getMyExam(Integer id);

	Map<String, Object> getExercise(Integer id);
	
}
