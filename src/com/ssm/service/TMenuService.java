package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TMenu;
import com.ssm.vo.MenuJson;

public interface TMenuService {
	List<TMenu> selectById(Integer userId);
	
	List<TMenu> selectAll();
	
	List<MenuJson> selectMenu(Integer userId);
}
