package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.vo.YTaskListVo;

public interface YTaskManagerMapper {
	// json查询
	public List<YTaskListVo> renderTaskList(@Param("clazzId")Integer clazzId,@Param("currentType")Integer currentType);
	// 批量删除
	public Integer deleteTaskByIds(String[] idArr);
	public Integer deleteClazzTask(String[] idArr);
	public Integer deleteStudentRos(String[] idArr);
	public Integer deleteStudentAsnwer(String[] idArr);
	
}