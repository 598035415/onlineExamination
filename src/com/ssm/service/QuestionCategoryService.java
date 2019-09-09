package com.ssm.service;

import java.util.List;

import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;
import com.ssm.vo.QuestionCategoryVo;

public interface QuestionCategoryService {
	
	public ResponseEntity<List<QuestionCategoryVo>> pageQuestionCategory(Page pa);
	
	public ResponseEntity<List<QuestionCategoryVo>> parentQuestionCategory(Page pa);
	
	public  ResponseEntity<QuestionCategoryVo> addQuestionCategory(QuestionCategoryVo td);
	
	public  ResponseEntity<QuestionCategoryVo> upQuestionCategory(QuestionCategoryVo td);
	
	public  ResponseEntity<QuestionCategoryVo> delQuestionCategory(QuestionCategoryVo td);
	
	public ResponseEntity<QuestionCategoryVo> cu(QuestionCategoryVo td);
}
