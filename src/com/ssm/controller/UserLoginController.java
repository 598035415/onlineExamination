package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserLoginController {

	@RequestMapping("userLogin")
	public String userLogin(String username, String password) {
		
		return "";
	}
}
