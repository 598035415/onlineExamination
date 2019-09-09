package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.TQuestion;
import com.ssm.vo.QuestionVo;

public interface TQuestionMapper {
	
	List<QuestionVo> queryQuestionList();
	
	Integer addQuestion(TQuestion question);
	
	Integer delCheckedQuestion(Integer[] questionIds);
	
	TQuestion selectQuestionById(Integer questionId);
}