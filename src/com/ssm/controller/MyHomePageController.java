package com.ssm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.common.GlobalSessionUser;
import com.ssm.pojo.TUser;

@Controller
public class MyHomePageController {

	@RequestMapping("/profile")
	public void profile(HttpServletRequest request, HttpServletResponse response) {
		judgeUser(request, response, "OnLine/leading-page/my-homePage/profile.jsp");
	}
	
	public void judgeUser(HttpServletRequest request, HttpServletResponse response, String url)  {
		TUser user = (TUser) request.getSession().getAttribute(GlobalSessionUser.preCurrentUser.toString());
		try {
			if (null != user) {
				request.getRequestDispatcher(url).forward(request, response);
			}else {
				response.sendRedirect("OnLine/leading-page/home.jsp");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
}
