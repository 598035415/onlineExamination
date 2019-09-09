package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TMenu;

public interface TMenuMapper {
	List<TMenu> selectById(@Param("userId")Integer userId);
	
	List<TMenu> selectAll();
	
	List<TMenu> queryAllMenu();
}