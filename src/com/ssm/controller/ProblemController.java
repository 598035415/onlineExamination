package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.pojo.TQuestion;
import com.ssm.pojo.TQuestionCategory;
import com.ssm.service.ProblemService;
import com.ssm.util.LayUITableBean;
import com.ssm.vo.ProblemDetailVO;

@Controller
public class ProblemController {
	private static final String PREFIX = "OnLine/leading-page/problem";
	@Autowired
	private ProblemService problemService;
	
	@RequestMapping("/problemset")
	public String problemSet() {
		return PREFIX+"/problemset.jsp";
	}
	
	@RequestMapping("/problemlist")
	public String problemList()  {
		return PREFIX+"/problemlist.jsp";
	}
	
	@RequestMapping("/problemdetail")
	public String problemDetail()  {
		return PREFIX+"/problemdetail.jsp";
	}
	
	/*public String judgeUser(HttpSession session, String url)  {
		TUser user = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if (null != user) {
			return url;
		}
		return "redirect:/online/home";
	}*/
	
	@RequestMapping("/problemsetList")
	@ResponseBody
	public List<TQuestionCategory> problemSetList(Integer page, Integer limit) {
		page = page == null ? 1 : page;
		limit = limit == null ? 6 : limit;
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
		LayUITableBean<TQuestion> layUITableBean = 
				problemService.problemListTable(categoryId, limit*(page-1), limit, keyword, questionCategory);
		return layUITableBean;
	}
	
	@RequestMapping("/problemdetailQuery")
	public String problemdetailQuery(HttpServletRequest request, String problemId, String categoryName, String categoryId) {
		List<ProblemDetailVO> list = problemService.problemdetailQuery(problemId);
		ProblemDetailVO problemTrue = new ProblemDetailVO();
		if (list != null && list.size() > 0) {
			for (ProblemDetailVO problemDetailVO : list) {
				if ("2".equals(problemDetailVO.getIsAnswerTrue())) {
					problemTrue = problemDetailVO;
					break;
				}
			}
			request.setAttribute("problemTrue", problemTrue);
			request.setAttribute("list", list);
		}
		return PREFIX+"/problemdetail.jsp";
	}
}