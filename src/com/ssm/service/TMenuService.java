package com.ssm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TMenu;
import com.ssm.util.ResponseEntity;
import com.ssm.vo.MenuJson;

public interface TMenuService {
	List<TMenu> selectById(Integer userId);
	
	List<TMenu> selectAll();
	
	List<TMenu> queryAllMenu();
	
	List<MenuJson> selectMenu(Integer userId);
	
	List<MenuJson> queryAllRole();
	
	ResponseEntity<TMenu> addMenu(String menuId,String menuName);

	ResponseEntity<TMenu> deleteMenu(String id);
}
