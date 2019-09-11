package com.ssm.service;


import org.springframework.web.bind.annotation.RequestParam;

import com.ssm.common.ServerResponse;
import com.ssm.pojo.CustomPublish;
import com.ssm.util.LayUITableBean;
import com.ssm.vo.YExamQuestionVO;
import com.ssm.vo.YTaskListVo;

public interface YTaskManagerService {
	// 任务列表，可带条件
	LayUITableBean<YTaskListVo> renderTaskList(Integer currentPage,Integer pageSize,Integer clazzId,Integer currentType);
	// 删除，批量删除等。
	ServerResponse<Object> deleteTaskByIds(String ids);
	ServerResponse<Object> savePublish(CustomPublish customPublish);
	
	// 后台查询试卷详情
	LayUITableBean<YExamQuestionVO> renderExamDetail(Integer page,Integer limit,Integer examId);
}
