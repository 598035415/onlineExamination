package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLoginController {
	
	@RequestMapping("/adminLogin")
	public String adminLogin(String username,String password) {
		System.out.println("用户名"+username+"密码"+password);
		
		
		return null;
	}
}
