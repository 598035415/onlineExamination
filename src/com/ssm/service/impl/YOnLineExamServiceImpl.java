package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.YOnLineExamMapper;
import com.ssm.service.YOnLineExamService;
import com.ssm.vo.YOnLineTaskListVO;

/**
 * 前端考试任务列表实现类
 * @Date 2019年9月6日
 * @Author YL
 */
@Service
public class YOnLineExamServiceImpl  implements YOnLineExamService{
	
	@Autowired
	private YOnLineExamMapper yOnLineExamMapper;
	
	// 前端考试任务列表
	@Override
	public List<YOnLineTaskListVO> onLineTaskList() {
		// 1,先查询出所有的单表擦澡
		return yOnLineExamMapper.selectOnLineTaskListAndExsting();
	}

}
