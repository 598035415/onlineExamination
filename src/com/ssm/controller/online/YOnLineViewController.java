package com.ssm.controller.online;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 前端视图控制器
 * @author YL
 *
 */
@Controller
public class YOnLineViewController {
	
	private static final String PRE_FIX = "/OnLine/leading-page/";
	
	// 进入首页
	@RequestMapping("/online/home")
	public String innerHome() {
		return PRE_FIX + "home.jsp";
	}
}
