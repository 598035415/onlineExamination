package com.ssm.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.common.GlobalSessionUser;
import com.ssm.pojo.TUser;

@Controller
public class MyHomePageController {

	private static final String PREFIX = "OnLine/leading-page/my-homePage";
	
	@RequestMapping("/profile")
	public String profile(HttpSession session) {
		return judgeUser(session, PREFIX+"/profile.jsp");
	}
	
	@RequestMapping("/password")
	public String password(HttpSession session) {
		return judgeUser(session, PREFIX+"/password.jsp");
	}
	
	@RequestMapping("/myExam")
	public String myExam(HttpSession session) {
		return judgeUser(session, PREFIX+"/myExam.jsp");
	}
	
	@RequestMapping("/myExercise")
	public String myExercise(HttpSession session) {
		return judgeUser(session, PREFIX+"/myExercise.jsp");
	}
	public String judgeUser(HttpSession session, String url)  {
		TUser user = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if (null != user) {
			return url;
		}
		return "redirect:/online/home";
	}
}
