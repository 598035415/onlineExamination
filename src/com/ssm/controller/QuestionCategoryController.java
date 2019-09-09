package com.ssm.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.dao.QuestionCategoryDao;
import com.ssm.util.Page;
import com.ssm.vo.QuestionCategoryVo;

@Controller
public class QuestionCategoryController {

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
		System.out.println( "增加："+ qcd.addQuestionCategory(qcv) );
		
		
		qcv.setCategoryName("测试--- ");
		qcv.setParentId(9);
		qcv.setCategoryPicture("6666666666---.jpg");
		qcv.setCategoryName("测试人员---");
		qcv.setUpdateTime(new Date());
		System.out.println("修改："+qcd.upQuestionCategory(qcv)   );
		
		
		System.out.println("删除："+qcd.delQuestionCategory(qcv));
		
		return qcd.selecQuestionCategoryPage(pa).toString();
	}*/
	
	
}
