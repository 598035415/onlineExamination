package com.ssm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.pojo.TUser;
import com.ssm.service.TMenuService;
import com.ssm.vo.MenuJson;

@Controller
public class MenuController {
	
	@Autowired
	private TMenuService service ;
	
	@RequestMapping("/adminIndex")
	public void index(HttpServletResponse response) {
		try {
			response.sendRedirect("WeAdmin/index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/leftMenu")
	@ResponseBody
	public Map<String, Object> adminIndex(HttpServletRequest request){
		Map<String, Object> data = new HashMap<String, Object>();
		TUser user = (TUser) request.getSession().getAttribute("user");
		List<MenuJson> selectMenu = service.selectMenu(user.getId());
		data.put("status", 0);
		data.put("msg", "ok");
		data.put("data", selectMenu);
		System.out.println(selectMenu);
		return data;
	}
}
