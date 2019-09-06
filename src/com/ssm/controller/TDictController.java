package com.ssm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.dao.TDictDao;
import com.ssm.util.Page;

import jdk.nashorn.internal.runtime.JSONFunctions;

@Controller
public class TDictController {
	
	@Autowired
	TDictDao tm;
	
	@RequestMapping("dictPage")
	@ResponseBody
	public String  dictPage(Page pa,HttpServletResponse response ) throws IOException {
		
		pa.setPage(0);
		pa.setLimit(10);
		
		return tm.selectDictPage(pa).toString();
	} 
	
}
