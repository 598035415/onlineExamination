package com.ssm.dao;

import org.springframework.stereotype.Repository;

import com.ssm.pojo.TClazz;
import com.ssm.util.LayUITableBean;

@Repository
public interface TClazzMapper {
	public LayUITableBean<TClazz> clazzSelede(String limit,String page);
}