package com.ssm.service;

import com.ssm.pojo.TClazz;
import com.ssm.util.LayUITableBean;

public interface ClazzService {
	
	LayUITableBean<TClazz> clazzSelect(Integer limit,Integer page,String userid);
	
	Integer clazzDelete(String userId);
	
	Integer clazzAdd(String clazzName,String userId,String createTimes);
	
	Integer clazzUpdate(TClazz clazz);
	
	TClazz clazzUpdateSelect(String clazzId);
	
	LayUITableBean<TClazz> adminClazzSelect(Integer limit, Integer page);
}
