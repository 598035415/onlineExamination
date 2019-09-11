package com.ssm.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.LWPersonalCenterMapper;
import com.ssm.service.PersonalCenterService;

@Service
public class PersonalCenterServiceImpl implements PersonalCenterService {

	@Autowired
	private LWPersonalCenterMapper lwPersonalCenterMapper;
	
	private Map<String, Object> map = new HashMap<String, Object>();
	
	@Override
	public String updateHeadPortrait(Integer id, String fileName) {
		map.put("id", id);
		map.put("headPortrait", fileName);
		Integer userUpdate = lwPersonalCenterMapper.userUpdate(map);
		if (userUpdate > 0) {
			return "success";
		}
		return "failure";
	}

	@Override
	public String updatePassword(Integer id, String password) {
		map.put("id", id);
		map.put("password", password);
		Integer userUpdate = lwPersonalCenterMapper.userUpdate(map);
		if (userUpdate > 0) {
			return "success";
		}
		return "failure";
	}

	@Override
	public String updateUser(Integer id, String gender, String birthday) {
		map.put("id", id);
		map.put("gender", gender);
		map.put("birthday", birthday);
		Integer userUpdate = lwPersonalCenterMapper.userUpdate(map);
		if (userUpdate > 0) {
			return "success";
		}
		return "failure";
	}
	
	

}
