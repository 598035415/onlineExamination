package com.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.pojo.TUser;
import com.ssm.service.TUserService;
import com.ssm.util.ResponseEntity;

@Controller
public class AdminLoginController {
	
	@Autowired
	private TUserService service;
	
	@RequestMapping("/adminLogin")
	public String adminLogin(HttpServletRequest request,String username,String password) {
		ResponseEntity<TUser> entity = service.backgroundLogin(username, password);
		System.out.println(entity.getData());
		System.out.println(entity.getMsg());
		if("200".equals(entity.getCode())) {
			HttpSession session = request.getSession();
			session.setAttribute("user",entity.getData());
		}else {
			
		}
		return null;
	}
}
