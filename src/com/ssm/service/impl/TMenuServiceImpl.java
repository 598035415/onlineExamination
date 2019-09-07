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
	public List<TMenu> selectById(Integer userId) {
		return dao.selectById(userId);
	}

	@Override
	public List<TMenu> selectAll() {
		return dao.selectAll();
	} 
	
	public List<MenuJson> selectMenu(Integer userId){
		List<TMenu> selectById = selectById(userId);
		List<TMenu> k = selectAll();
		for (TMenu tMenu : selectById) {
			MenuJson json = new MenuJson();
			json.setId(tMenu.getId());
			json.setName(tMenu.getMenuName());
			json.setUrl(tMenu.getUrl());
			for (TMenu tMenu2 : k) {
				MenuJson jsont = new MenuJson();
				if(tMenu2.getParentId()==tMenu.getId()) {
					jsont.setId(tMenu2.getId());
					jsont.setName(tMenu2.getMenuName());
					jsont.setUrl(tMenu2.getUrl());
					json.getChildren().add(jsont);
				}
				menuJsonList.add(json);
			}
		}
		return menuJsonList;	
	}

}
