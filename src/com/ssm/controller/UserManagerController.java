package com.ssm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.pojo.TUser;
import com.ssm.service.TUserManagerService;
import com.ssm.util.ResponseEntity;

@Controller
public class UserManagerController {
	@Autowired
	private TUserManagerService service;
	
	@RequestMapping("userQuery")
	public String queryUserAll(HttpServletRequest request) throws ServletException, IOException {
		List<TUser> queryUserAll = service.queryUserAll();
		request.setAttribute("userList", queryUserAll);
		return "WeAdmin/pages/admin/list.jsp";
	}
	
	@RequestMapping("addUser")
	@ResponseBody
	public ResponseEntity<TUser> addUser(String username,String gender,String role,String pass,String repass,String birthdays){
		ResponseEntity<TUser> addUser = service.addUser(username, gender, role, pass, repass, birthdays);
		return addUser;
	}
}
