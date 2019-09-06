package com.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.ssm.service.IQuestionService;
import com.ssm.util.ServerResponse;
import com.ssm.vo.QuestionVo;

/**
 * 实体控制类
 * @author chenlei
 */
@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private IQuestionService questionService;
	
	/**
	 * 跳转
	 */
	@RequestMapping("/{index}")
	public String questionIndex(@PathVariable String index) {
		return "WeAdmin/pages/question/"+index+".jsp";
	}
	
	/**
	 * 试题列表
	 * @return
	 */
	@RequestMapping("/questionList")
	public String questionList(Integer pageNum, Integer pageSize, Model model) {
		model.addAttribute("serverResponse", questionService.queryQuestionList(pageNum, pageSize));
		return "/WeAdmin/pages/question/list.jsp";
	}
}
