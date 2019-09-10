package com.ssm.dao;

import java.util.List;

import com.ssm.util.Page;
import com.ssm.vo.QuestionCategoryVo;

public interface QuestionCategoryDao {
	public  List<QuestionCategoryVo>  selecQuestionCategoryPage(Page pa);
	
	public Long selecQuestionCategoryCount(Page pa);
	
	// SELECT  * FROM t_question_category  where  parent_id=0 and  status=1 
	public   List<QuestionCategoryVo>  selecQuestionCategoryParent();
	
	public int addQuestionCategory(QuestionCategoryVo qcv);
	
	public int upQuestionCategory(QuestionCategoryVo qcv);
	
	public int delQuestionCategory(QuestionCategoryVo qcv);
}
