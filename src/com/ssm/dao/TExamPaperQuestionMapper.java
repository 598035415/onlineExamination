package com.ssm.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.ssm.vo.ExamPaperQuestionVo;

public interface TExamPaperQuestionMapper {
	Integer addExamPaperQuestion(@Param("examId") Integer examId, @Param("questionId") Integer questionId);
	
	List<ExamPaperQuestionVo> selectExamPaperInfoById(Integer examPaperId);
}