package com.ssm.service;

import java.util.List;
import java.util.Map;

import com.ssm.common.CostomPage;
import com.ssm.common.ExamRowsQuestionAnser;
import com.ssm.common.ServerResponse;
import com.ssm.vo.YOnLineTaskListVO;

/**
 * 在线考试service
 * @Date 2019年9月6日
 * @Author YL
 */
public interface YOnLineExamService {
	
	// 前端考试任务列表
	CostomPage<YOnLineTaskListVO>  onLineTaskList(Integer currentPage);
	// 前端考试渲染
	Map<String,Object> examPageRender(Integer taskId);
	
	// 交卷
	ServerResponse<Integer> addPage(Integer userId,Integer taskId,List<ExamRowsQuestionAnser> questionAnserList);
	
	
}
