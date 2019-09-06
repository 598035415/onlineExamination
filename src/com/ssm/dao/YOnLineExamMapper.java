package com.ssm.dao;

import java.util.List;

import com.ssm.vo.YOnLineTaskListVO;

public interface YOnLineExamMapper {
	// 查询所有任务列表，并且存在的
	List<YOnLineTaskListVO> selectOnLineTaskListAndExsting();
}