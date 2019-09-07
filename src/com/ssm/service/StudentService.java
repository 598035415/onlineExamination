package com.ssm.service;

import com.ssm.pojo.TUser;
import com.ssm.util.LayUITableBean;

public interface StudentService {
	LayUITableBean<TUser> StudentSelect(String clazzId,String limit,String page);
}
