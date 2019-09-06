package com.ssm.service;

import java.util.List;

import com.ssm.vo.YOnLineTaskListVO;

/**
 * 在线考试service
 * @Date 2019年9月6日
 * @Author YL
 */
public interface YOnLineExamService {
	
	// 前端考试任务列表
	List<YOnLineTaskListVO>  onLineTaskList();
	
}
