package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JViewController {
	
	private static final String PREFIX =  "/WeAdmin/pages/";
	
	private static final String SUFFIX = ".jsp";
	//
	
	@RequestMapping("/{folder}/{page}")
	public String innerViewPage(@PathVariable(value = "folder") String folder
							,@PathVariable(value = "page") String page) {
		System.out.println("物理视图名称：" + PREFIX + folder + "/" + page + SUFFIX);
		return PREFIX + folder + "/" + page + SUFFIX; 
	}
	
}
