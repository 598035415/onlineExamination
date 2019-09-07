package com.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.pojo.TMenu;
import com.ssm.pojo.TUser;
import com.ssm.service.TMenuService;
import com.ssm.vo.MenuJson;

@Controller
public class MenuController {
	
	@Autowired
	private TMenuService service ;
	
	private Map<String, Object> data = new HashMap<String, Object>();
	
	@RequestMapping("adminIndex")
	public List<TMenu> adminIndex(HttpServletRequest request){
		TUser user = (TUser) request.getSession().getAttribute("user");
		System.out.println("MenuController adminIndex Method");
		List<MenuJson> selectMenu = service.selectMenu(user.getId());
		for (MenuJson menuJson : selectMenu) {
			System.out.println(menuJson);
		}
		return null;
	}
}
