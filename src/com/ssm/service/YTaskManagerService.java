package com.ssm.service;


import com.ssm.common.ServerResponse;
import com.ssm.pojo.CustomPublish;
import com.ssm.util.LayUITableBean;
import com.ssm.vo.YTaskListVo;

public interface YTaskManagerService {
	// 任务列表，可带条件
	LayUITableBean<YTaskListVo> renderTaskList(Integer currentPage,Integer pageSize,Integer clazzId,Integer currentType);
	// 删除，批量删除等。
	ServerResponse<Object> deleteTaskByIds(String ids);
	ServerResponse<Object> savePublish(CustomPublish customPublish);
}
