package com.ssm.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ssm.pojo.TUser;
import com.ssm.service.LogService;
import com.ssm.util.LogBrokenLine;
import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;
import com.ssm.vo.TLogVo;

@Controller
public class LogController {

	@Autowired
	private LogService ls;
	
	
	@RequestMapping("ac")
	@ResponseBody
	public String log(Page pa,HttpServletRequest request) {
	
		Cookie[] cookies = request.getCookies();
		if (cookies!=null && cookies.length>0) {
			for (int i = 0; i < cookies.length; i++) {
				System.out.println(  cookies[i].getName()   );
				System.out.println(  cookies[i].getValue()   );
			}
		}
		
		
		
		
		
		return JSON.toJSONString("6666");
		
	}
	
	
	@RequestMapping("logPage")
	@ResponseBody
	public String logPage(Page pa) {
		ResponseEntity<List<TLogVo>> re  = ls.pageLog(pa);
		return JSON.toJSONString(re);
	}
	
	@RequestMapping("logBL")
	@ResponseBody
	public String logBL(Page pa ) {
		ResponseEntity<List<LogBrokenLine>> re  = ls.blLog(pa);
		return JSON.toJSONString(re);
	}
	
	
	
	@RequestMapping("logDel")
	@ResponseBody
	public String logDel(TLogVo tlv )  {
		ResponseEntity<TLogVo> re = ls.delLog(tlv);
		return JSON.toJSONString(re);
	}
	
	@RequestMapping("logGoCU")
	public void logGoCU(HttpServletRequest request,HttpServletResponse response,TLogVo tlv) throws ServletException, IOException {
		init(request, response);
		
		request.setAttribute("log",tlv);
		
		request.getRequestDispatcher("WeAdmin/pages/log/logAddOrEid.jsp").forward(request, response);
		
	}
	
	@RequestMapping("logCU")
	@ResponseBody
	public String logCU(TLogVo tlv,HttpSession session) {
		TUser tu=(TUser) session.getAttribute("user");
		//  将修改人 加进去
		if (tu!=null) {
			tlv.setUpdatePerson(tu.getUsername());
		}
		ResponseEntity<TLogVo> re = ls.cu(tlv);
		return JSON.toJSONString(re);
	}
	
	
	
	
	public void init(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");		
		
	}
	
}
