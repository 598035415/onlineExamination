package com.ssm.filter;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.pojo.TUser;
import com.ssm.service.LogService;
import com.ssm.vo.TLogVo;

@Component
public class LoginFilter implements HandlerInterceptor{

	@Autowired
	private LogService ls;
	
	@Override  //在 调用方法之前 
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		
	
		return true;
	}

	@Override //在调用 方法 之后
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
	
		TUser tu=(TUser) request.getSession().getAttribute("user");
		TLogVo tlv = new TLogVo();
		
		String name= request.getLocalName();
		String ip = request.getRemoteAddr();
		
		// 登入 名称
		tlv.setLoginName(name);
		// ip
		tlv.setLoginIp(ip);
		tlv.setMsg("  操作：登入  \n\t   ");
		tlv.setCreateTime(new Date());
		
	
		
		if (tu!=null) {
			tlv.setMsg( tlv.getMsg()+ "  结果：成功 ");
			tlv.setLoginName(tu.getUsername());
		}else {
			tlv.setMsg( tlv.getMsg()+ "  结果：失败 ");
		}
	
		ls.addLog(tlv);

	}
	
	
	@Override //销毁 时
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}
	
	

}
