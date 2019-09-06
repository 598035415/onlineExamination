package com.ssm.service;

import com.ssm.pojo.TClazz;
import com.ssm.util.LayUITableBean;

public interface ClazzService {
	
	LayUITableBean<TClazz> clazzSelect(String limit,String page,String userid);
	
	Integer clazzUpdate(String userId);
}
