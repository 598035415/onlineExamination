package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TQuestion;
import com.ssm.vo.QuestionVo;

public interface TQuestionMapper {
	
	List<QuestionVo> queryQuestionList();
	
	Integer addQuestion(TQuestion question);
	
	Integer delCheckedQuestion(Integer[] questionIds);
	
	TQuestion selectQuestionById(Integer questionId);
	
	Integer updateQuestion(TQuestion question);
	
	List<TQuestion> selectIdQuestionContent();
	
	List<TQuestion> selectQuestionByCategoryId(Integer categoryId);
	
	List<TQuestion> selectAllQuestion();
	
	Integer selectSocreByQuestionId(Integer[] questionIds);
	
	Integer updateStatusById(@Param("id") Integer id, @Param("status") Integer status);
}