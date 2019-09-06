package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.TDict;
import com.ssm.util.Page;

public interface TDictMapper {
	
	public List<TDict> selectDictPage(Page pa);
	
	
}