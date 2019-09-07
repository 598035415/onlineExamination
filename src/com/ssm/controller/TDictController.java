package com.ssm.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ssm.pojo.TDict;
import com.ssm.service.TDictService;
import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;

@Controller
public class TDictController {
	
	@Autowired
	private TDictService tds;
	
	@RequestMapping("dictPage")
	@ResponseBody
	public String  dictPage(Page pa  ) throws IOException {
		
	//	pa.setPage(0);
	//	pa.setLimit(10);
		
		ResponseEntity<List<TDict>> re = tds.pageDict(pa);
		
		return JSON.toJSONString(re);
	} 
	
	
	@RequestMapping("dictAdd")
	@ResponseBody
	public String  dictAdd(TDict td) throws IOException {
		
	//	td.setLabel("学生");
	//	td.setValue("0001");
	//	td.setType("5");
	//	td.setSort(1);

		td.setCreateTime(new Date());
		ResponseEntity<TDict> re = tds.addDict(td);
		
		return re.toString();
	} 
	
	@RequestMapping("dictUp")
	@ResponseBody
	public String  dictUp(TDict td) throws IOException {
		
	//	td.setId(16);
	//	td.setLabel("初生");
	//	td.setValue("0003");
	//	td.setType("5");
	//	td.setSort(1);
		
		td.setCreateTime(new Date());
		ResponseEntity<TDict> re = tds.upDict(td);
		
		return re.toString();
	} 
	
	// 删除
	@RequestMapping("dictDel")
	@ResponseBody
	public String  dictDel(TDict td) throws IOException {
	//	td.setId(16);
		ResponseEntity<TDict> re = tds.delDict(td);
		
		return re.toString();
	} 
	
	
	
	
	
	@RequestMapping("dictCU")
	public void dictCU(HttpServletRequest request,HttpServletResponse response,TDict td ) throws ServletException, IOException {
		init(request, response);
		if(  td.getId()==null || "".equals(td.getId()) ) {
			request.setAttribute("TDict", new TDict());
		}else {
			request.setAttribute("TDict", td);
		}
		request.getRequestDispatcher("dictAddOrEid.jsp").forward(request, response);
		
	}
	
	//  修改 和 增加  
	@RequestMapping("dictCU")
	@ResponseBody
	public String  dictCU(TDict td) throws IOException {
		ResponseEntity<TDict> re = tds.cu(td);
		return re.toString();
	} 
	
	
	public void init(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
	}
	
}
