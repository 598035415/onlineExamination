package com.ssm.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ssm.pojo.TUser;
import com.ssm.service.QuestionCategoryService;
import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;
import com.ssm.vo.QuestionCategoryVo;
import com.ssm.vo.TLogVo;

@Controller
public class QuestionCategoryController {

	@Autowired
	private QuestionCategoryService qcs;
	
	@RequestMapping("tomcat")
	public void tomcat() {
		
		System.out.println(    System.getProperty("catalina.home")    );
	}
	
	@RequestMapping("qcPage")
	@ResponseBody
	public String qcPage(Page pa) {
		ResponseEntity<List<QuestionCategoryVo>> re  = qcs.pageQuestionCategory(pa);
		return JSON.toJSONString(re);
	}
	
	@RequestMapping("qcParent")
	@ResponseBody
	public String qcParent() {
		ResponseEntity<List<QuestionCategoryVo>> re  = qcs.parentQuestionCategory();
		return JSON.toJSONString(re);
	}
	
	@RequestMapping("qcDel")
	@ResponseBody
	public String qcDel(QuestionCategoryVo qcv) {
		ResponseEntity<QuestionCategoryVo> re  = qcs.delQuestionCategory(qcv);
		return JSON.toJSONString(re);
	}
	
	@RequestMapping("qcCU")
	@ResponseBody
	public String qcCU(QuestionCategoryVo qcv,HttpSession  session) {
		// 设置 增加 和 修改时间
		Date da=new Date();
		qcv.setCreateTime(da);
		qcv.setUpdateTime(da);
		//设置修改人
		TUser tu=(TUser) session.getAttribute("user");
		//  将修改人 加进去
		if (tu!=null) {
			qcv.setCreatePerson(tu.getUsername());
		}
		
		ResponseEntity<QuestionCategoryVo> re  = qcs.cu(qcv);
		return JSON.toJSONString(re);
	}
	
	
	@RequestMapping("qcGoCU")
	public void logGoCU(HttpServletRequest request,HttpServletResponse response,QuestionCategoryVo qcv) throws ServletException, IOException {
		init(request, response);
		
		request.setAttribute("qc",qcv);
		
		request.getRequestDispatcher("WeAdmin/pages/question/questionCategoryAddOrEid.jsp").forward(request, response);
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	@Autowired
	private QuestionCategoryDao qcd;
	
	@RequestMapping("quTest")
	@ResponseBody
	public String test(Page pa) {
		
		pa.setPage(0);
		pa.setLimit(10);
		
		System.out.println(  "数量 ："+qcd.selecQuestionCategoryCount(pa)  );
		System.out.println( "一级菜单："+qcd.selecQuestionCategoryParent() );
		
		
		QuestionCategoryVo qcv = new QuestionCategoryVo();
		
		qcv.setCategoryName("测试 ");
		qcv.setParentId(0);
		qcv.setCategoryPicture("6666666666.jpg");
		qcv.setCategoryName("测试人员");
		qcv.setCreateTime(new Date());
		qcv.setCreatePerson("小学生智力");
		System.out.println( "增加："+ qcs.addQuestionCategory(qcv));
		
		
		qcv.setCategoryName("测试--- ");
		qcv.setParentId(9);
		qcv.setCategoryPicture("6666666666---.jpg");
		qcv.setCategoryName("测试人员---");
		qcv.setUpdateTime(new Date());
		System.out.println("修改："+qcs.upQuestionCategory(qcv)   );
		
		
		System.out.println("删除："+qcs.delQuestionCategory(qcv));
		
		return qcs.pageQuestionCategory(pa).toString();
	}*/
	
	
}
