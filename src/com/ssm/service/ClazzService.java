package com.ssm.service;

import com.ssm.pojo.TClazz;
import com.ssm.util.LayUITableBean;

public interface ClazzService {
	
	LayUITableBean<TClazz> clazzSelect(Integer limit,Integer page,String userid);
	
	Integer clazzUpdate(String userId);
	
	Integer clazzAdd(String clazzName,String userId,String createTimes);
}
