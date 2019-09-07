package com.ssm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.GlobalSessionUser;
import com.ssm.pojo.TUser;
import com.ssm.service.TUserService;
import com.ssm.util.ResponseEntity;

@Controller
public class UserController {

	@Autowired
	private TUserService tUserService;
	
	@RequestMapping("/userLogin")
	@ResponseBody
	public ResponseEntity<TUser> userLogin(HttpServletRequest requset, String username, String password) {
		ResponseEntity<TUser> entity = tUserService.frontDeskLogin(username, password);
		if ("200".equals(entity.getCode())) {
			HttpSession session = requset.getSession();
			session.setAttribute(GlobalSessionUser.preCurrentUser.toString(), entity.getData());
			session.setMaxInactiveInterval(-1);
			entity.setData(null);
		}
		return entity;
	}
	
	@RequestMapping("/userLogout")
	public void userLogout(HttpServletRequest requset, HttpServletResponse response) throws IOException {
		requset.getSession().removeAttribute(GlobalSessionUser.preCurrentUser.toString());
		response.sendRedirect("OnLine/leading-page/home.jsp");
	}
}
