package com.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.dao.TestDao;

@Controller
public class TestController {
	@Autowired
	TestDao  td;
	
//	public static Logger lo =Logger.getLogger(Test.class);

	
	@RequestMapping("a")
	public void test() {
		System.out.println("===================");
	
		
		System.out.println(  td.selectAll()  );
		
		for (int i = 0; i < 100; i++) {
		//	lo.info("==========================================================");
		}
		
		for (int i = 0; i < 100; i++) {
	//		lo.debug("-----------------------------------------------------");
		}
		
		
		
	}
	
	
}
