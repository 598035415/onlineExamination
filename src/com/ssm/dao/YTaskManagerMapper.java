package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.vo.YTaskListVo;

public interface YTaskManagerMapper {
	public List<YTaskListVo> renderTaskList(@Param("clazzId")Integer clazzId,@Param("currentType")Integer currentType);
	
}