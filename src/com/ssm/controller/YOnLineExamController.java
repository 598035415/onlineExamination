package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *  前台在线考试Controller
 * @Date 2019年9月6日
 * @Author YL
 */
@Controller 
@RequestMapping("/online")
public class YOnLineExamController {
	
	/**
	 * 前台考试任务列表
	 * @return
	 */
	@RequestMapping("/task/list")
	public @ResponseBody String toJson() {
		
		return "test";
	}
	
}
