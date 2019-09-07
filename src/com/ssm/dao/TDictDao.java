package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.TDict;
import com.ssm.util.Page;

public interface TDictDao {
	
	public List<TDict> selectDictPage(Page pa);
	
	
}