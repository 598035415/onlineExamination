package com.ssm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.GlobalSessionUser;
import com.ssm.pojo.TUser;
import com.ssm.service.TUserService;
import com.ssm.util.ResponseEntity;

@Controller
public class UserLoginController {

	@Autowired
	private TUserService tUserService;
	
	@RequestMapping("/userLogin")
	@ResponseBody
	public ResponseEntity<TUser> userLogin(HttpServletRequest requset, String username, String password) {
		ResponseEntity<TUser> entity = tUserService.frontDeskLogin(username, password);
		if ("200".equals(entity.getCode())) {
			requset.getSession().setAttribute(GlobalSessionUser.preCurrentUser.toString(), entity.getData());
			entity.setData(null);
		}
		return entity;
		
	}
}
