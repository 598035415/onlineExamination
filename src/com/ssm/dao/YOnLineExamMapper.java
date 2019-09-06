package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.ssm.vo.YOnLineTaskListVO;

public interface YOnLineExamMapper {
	
	// 查询所有任务列表，并且存在的
	List<YOnLineTaskListVO> selectOnLineTaskListAndExsting();
	
	// 更新记录，当前时间之前的所有启动时间，状态码为1  ,未进行
	@Update("update t_exam_publish set `current_type` = 1 where start_time > #{0}")
	Integer updateExamPublishStatusBefore (String currentTime);
	
	// 更新记录，介于开始时间和结束之间的 ，状态码为2，进行中 
	@Update("update t_exam_publish set `current_type` = 2 where #{0} BETWEEN start_time AND  end_time ")
	Integer updateExamPublishStatusBetweenAnd(String currentTime);
	
	// 更新记录，介于开始时间和结束之间的 ，状态码为3，已结束 
	@Update("update t_exam_publish set `current_type` = 3 where end_time < #{0} ")
	Integer updateExamPublishStatusAfter(String currentTime);
	
	
	
	
	
	
}