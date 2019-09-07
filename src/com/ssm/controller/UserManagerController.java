package com.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.pojo.TUser;
import com.ssm.service.TUserManagerService;

@Controller
public class UserManagerController {
	@Autowired
	private TUserManagerService service;
	
	@RequestMapping("userQuery")
	public void queryUserAll(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		List<TUser> queryUserAll = service.queryUserAll();
		System.out.println(queryUserAll);
		request.getRequestDispatcher("list.html").forward(request, response);
	}
}
