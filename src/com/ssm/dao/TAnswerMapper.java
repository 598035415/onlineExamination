package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TAnswer;

public interface TAnswerMapper {
	Integer addAnswer(TAnswer answer);
	
	//Integer delAnswerByQuestionId(Integer[] questionIds);
	
	List<TAnswer> selectAnswerByQuestionId(Integer questionId);
	
	Integer updateAnswerByQuestionId(@Param("answerContent") String answerContent,
									 @Param("isAnswerTrue") Integer isAnswerTrue,
									 @Param("questionId") Integer questionId,
									 @Param("answerSelect") Integer answerSelect);
	
	Integer deleteAnswerByQuestionId(Integer questionId);
}