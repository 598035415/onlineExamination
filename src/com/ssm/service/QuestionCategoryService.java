package com.ssm.service;

import java.util.List;

import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;
import com.ssm.vo.QuestionCategoryVo;

public interface QuestionCategoryService {
	// 分页  模糊  查询
	public ResponseEntity<List<QuestionCategoryVo>> pageQuestionCategory(Page pa);
	
	// 只查 父类节点
	public ResponseEntity<List<QuestionCategoryVo>> parentQuestionCategory();
	
	// 增加 
	public  ResponseEntity<QuestionCategoryVo> addQuestionCategory(QuestionCategoryVo qcv);
	
	// 修改
	public  ResponseEntity<QuestionCategoryVo> upQuestionCategory(QuestionCategoryVo qcv);
	
	// 删除
	public  ResponseEntity<QuestionCategoryVo> delQuestionCategory(QuestionCategoryVo qcv);
	
	//  调用  增加 或 修改 
	public ResponseEntity<QuestionCategoryVo> cu(QuestionCategoryVo qcv);
}
