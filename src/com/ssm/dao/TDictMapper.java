package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TDict;
import com.ssm.util.Page;

public interface TDictMapper {
	
	public List<TDict> selectDictPage(Page pa);
	
	List<String> selectLabelByType(@Param("typeId") Integer typeId);
}