package com.ssm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.dao.TDictMapper;
import com.ssm.util.Page;

@Controller
public class TDict {
	
	@Autowired
	TDictMapper tm;
	
	@RequestMapping("dictPage")
	public void  dictPage(Page pa,HttpServletResponse response ) throws IOException {
		
		pa.setPage(0);
		pa.setLimit(10);
		
		
		response.getWriter().print(   tm.selectDictPage(pa)   );
		
	} 
	
}
