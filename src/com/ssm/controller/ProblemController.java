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

import com.ssm.common.GlobalSessionUser;
import com.ssm.pojo.TQuestion;
import com.ssm.pojo.TQuestionCategory;
import com.ssm.pojo.TUser;
import com.ssm.service.ProblemService;
import com.ssm.util.LayUITableBean;

@Controller
public class ProblemController {
	
	@Autowired
	private ProblemService problemService;
	
	@RequestMapping("/problemset")
	public void problemSet(HttpServletRequest request, HttpServletResponse response) {
		judgeUser(request, response, "OnLine/leading-page/problem/problemset.jsp");
	}
	
	@RequestMapping("/problemlist")
	public void problemList(HttpServletRequest request, HttpServletResponse response)  {
		judgeUser(request, response, "OnLine/leading-page/problem/problemlist.jsp");
	}
	
	@RequestMapping("/problemdetail")
	public void problemDetail(HttpServletRequest request, HttpServletResponse response)  {
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
	
	@RequestMapping("/problemsetList")
	@ResponseBody
	public List<TQuestionCategory> problemSetList(Integer page, Integer limit) {
		page = page == null ? 1 : page;
		limit = limit == null ? 6 : limit;
//		System.out.println(limit*(page-1));
//		System.out.println(limit);
		List<TQuestionCategory> problemSetList = problemService.getProblemSetList(limit*(page-1), limit);
		return problemSetList;
	}
	
	@RequestMapping("/problemsetCount")
	@ResponseBody
	public Integer problemSetCount() {
		return problemService.problemSetCount();
	}
	
	@RequestMapping("/problemListCategory")
	@ResponseBody
	public List<TQuestionCategory> problemListCategory(String categoryId) {
		List<TQuestionCategory> list = problemService.problemListCategory(categoryId);
		return list;
	}
	
	@RequestMapping("/problemListTable")
	@ResponseBody
	public LayUITableBean<TQuestion> problemListTable(HttpServletRequest request, String categoryId, Integer page, Integer limit, String keyword, String questionCategory) {
		System.err.println(categoryId);
		System.out.println(page);
		System.out.println(limit);
		System.out.println(keyword);
		System.out.println(questionCategory);
		LayUITableBean<TQuestion> layUITableBean = 
				problemService.problemListTable(categoryId, page, limit, keyword, questionCategory);
		return layUITableBean;
	}
	
}
