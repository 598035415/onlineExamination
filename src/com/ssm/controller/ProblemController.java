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
public class ProblemController {
	
	@RequestMapping("/problemset")
	public void problemset(HttpServletRequest request, HttpServletResponse response) {
		judgeUser(request, response, "OnLine/leading-page/problem/problemset.jsp");
	}
	
	@RequestMapping("/problemlist")
	public void problemlist(HttpServletRequest request, HttpServletResponse response)  {
		judgeUser(request, response, "OnLine/leading-page/problem/problemlist.jsp");
	}
	
	@RequestMapping("/problemdetail")
	public void problemdetail(HttpServletRequest request, HttpServletResponse response)  {
		judgeUser(request, response, "OnLine/leading-page/problem/problemdetail.jsp");
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
