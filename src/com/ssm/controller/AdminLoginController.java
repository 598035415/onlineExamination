package com.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.pojo.TUser;
import com.ssm.service.TUserService;
import com.ssm.util.ResponseEntity;

@Controller
public class AdminLoginController {
	
	@Autowired
	private TUserService service;
	
	@RequestMapping("/adminLogin")
	@ResponseBody
	public ResponseEntity<TUser> adminLogin(HttpServletRequest request,String username,String password) {
		ResponseEntity<TUser> entity = service.backgroundLogin(username, password);
		if("200".equals(entity.getCode())) {
			HttpSession session = request.getSession();
			session.setAttribute("user",entity.getData());
		}
		return entity;
	}
}
