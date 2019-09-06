package com.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.dao.TestDao;

@Controller
public class TestController {
	@Autowired
	TestDao  td;
	
	@RequestMapping("a")
	public void test() {
		
		System.out.println("===================");
		System.out.println(   td.selectAll() );
		
	}
	
}
