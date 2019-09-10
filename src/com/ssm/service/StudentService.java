package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TUser;
import com.ssm.util.LayUITableBean;

public interface StudentService {
	LayUITableBean<TUser> StudentSelect(String clazzId,Integer limit,Integer page);
	
	Integer StudentDelete(String userid);
	
	Integer StudentAdd(TUser tUser);
	
	List<TUser> teacherSelect();
}
