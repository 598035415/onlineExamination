package com.ssm.controller;

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
	public String adminLogin(String username,String password) {
		ResponseEntity<TUser> backgroundLogin = service.backgroundLogin(username, password);
		
		
		
		return null;
	}
}
