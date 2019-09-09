package com.ssm.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.pojo.TUser;

public class LoginFilter implements HandlerInterceptor{


	@Override  //在 调用方法之前 
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		
		for (int i = 0; i < 20; i++) {
			System.out.println(  "===============" );
		}
		return true;
	}

	@Override //在调用 方法 之后
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
		TUser tu=(TUser) arg0.getSession().getAttribute("user");
		
		for (int i = 0; i < 20; i++) {
			System.out.println(   tu  );
		}
		
	}
	
	
	@Override //销毁 时
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}
	
	

}
