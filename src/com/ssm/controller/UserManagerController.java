package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserManagerController {
	@RequestMapping("userQuery")
	public String queryUserAll() {
		return null;
	}
}
