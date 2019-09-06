package com.ssm.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.common.CostomPage;
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
	
	/**
	 *   前端考试任务列表
	 */
	@Override
	public CostomPage<YOnLineTaskListVO> onLineTaskList(Integer currentPage) {
		CostomPage<YOnLineTaskListVO> costomPage = new CostomPage<YOnLineTaskListVO>();
		costomPage.setCurrentPage(currentPage);
		// 维护考场状态变更情况
		String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		// 执行更新操作
		yOnLineExamMapper.updateExamPublishStatusBefore(currentTime);yOnLineExamMapper.updateExamPublishStatusBetweenAnd(currentTime);yOnLineExamMapper.updateExamPublishStatusAfter(currentTime);
		//  开启分页
		PageHelper.startPage(currentPage,costomPage.getPageSize());
		PageInfo<YOnLineTaskListVO> pageInfo = new PageInfo<YOnLineTaskListVO>(yOnLineExamMapper.selectOnLineTaskListAndExsting());
		costomPage.setCurrentPage(pageInfo.getPageNum());
		costomPage.setTotalCount(pageInfo.getTotal());
		costomPage.setResultList(pageInfo.getList());
		return costomPage;
			
	}
	
	/**
	 *  前端任务下的考场渲染，题目，信息。 
	 */
	@Override
	public Map<String, Object> examPageRender(Integer taskId,Integer userId) {
		// 1,根据任务id，查出vo
		
		// 2，根据任务id，查出该卷子下的所有题目。
		
		return null;
	}
	
	

}
