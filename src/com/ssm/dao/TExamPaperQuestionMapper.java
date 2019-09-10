package com.ssm.dao;

import org.apache.ibatis.annotations.Param;

public interface TExamPaperQuestionMapper {
	Integer addExamPaperQuestion(@Param("examId") Integer examId, @Param("questionId") Integer questionId);
}