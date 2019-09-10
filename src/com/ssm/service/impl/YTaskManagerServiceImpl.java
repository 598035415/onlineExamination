package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.YTaskManagerMapper;
import com.ssm.service.YTaskManagerService;
import com.ssm.util.LayUITableBean;
import com.ssm.vo.YTaskListVo;

@Service
public class YTaskManagerServiceImpl implements YTaskManagerService {
	
	
	@Autowired
	private YTaskManagerMapper tmm;
	
	@Override
	public LayUITableBean<YTaskListVo> renderTaskList(Integer currentPage, Integer pageSize, Integer clazzId,
			Integer currentType) {
		// 开启分页
		PageHelper.startPage(currentPage, pageSize);
		PageInfo<YTaskListVo> pageInfo = new PageInfo<YTaskListVo>(tmm.renderTaskList(clazzId, currentType));
		LayUITableBean<YTaskListVo> layUITableBean = new LayUITableBean<YTaskListVo>();
		layUITableBean.setCount(pageInfo.getTotal());
		layUITableBean.setData(pageInfo.getList());
		return layUITableBean;
	}

}
