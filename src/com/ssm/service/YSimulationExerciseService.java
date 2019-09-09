package com.ssm.service;

import java.util.List;

import com.ssm.common.ExamRowsQuestionAnser;
import com.ssm.common.LayUITreeUl;
import com.ssm.common.ServerResponse;
import com.ssm.vo.YExamQuestionVO;

public interface YSimulationExerciseService {
	
	// 渲染题目类目树
	List<LayUITreeUl> renderQuestionTypeTree();
	// 渲染test试卷的所有题目，根据选择的类目和数量
	List<YExamQuestionVO> renderTestQuestion(String checkeds,String count);
	// 提交test
	ServerResponse<String> addPage(Integer questionSize,String testName, Integer userId, String totalTime,List<ExamRowsQuestionAnser> testAnswerList);
}
