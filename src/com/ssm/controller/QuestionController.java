package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 实体控制类
 * @author chenlei
 */
@Controller
@RequestMapping("/question")
public class QuestionController {
	
	/**
	 * 试题列表
	 * @return
	 */
	@RequestMapping("/questionList")
	public String questionList() {
		return "/WeAdmin/pages/question/list.jsp";
	}
}
