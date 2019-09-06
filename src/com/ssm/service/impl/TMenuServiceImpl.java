package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TMenuMapper;
import com.ssm.pojo.TMenu;
import com.ssm.service.TMenuService;
import com.ssm.vo.MenuJson;

@Service
public class TMenuServiceImpl implements TMenuService {
	
	@Autowired
	private TMenuMapper dao ;
	
	List<MenuJson> menuJsonList;
	
	@Override
	public List<MenuJson> selectById(Integer userId) {
		List<TMenu> menuList = dao.selectById(userId);
		return null;
	}

}
