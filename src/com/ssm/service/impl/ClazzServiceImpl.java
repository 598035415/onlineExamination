package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TClazzMapper;
import com.ssm.pojo.TClazz;
import com.ssm.service.ClazzService;
import com.ssm.util.LayUITableBean;

@Service
public class ClazzServiceImpl implements ClazzService {
	@Autowired
	private TClazzMapper tClazzMapper;
	private LayUITableBean<TClazz> layUITableBean;
	/**
	 *  班级查询
	 */
	@Override
	public LayUITableBean<TClazz> clazzSelect(String limit, String page, String userid) {
		if(userid!=null&&"".equals(userid)) {
			return null;
		}
		int parseIndex = Integer.parseInt(page);
		int pageSize = Integer.parseInt(limit);
		int a=(parseIndex-1)*pageSize;
		Long clazzSelectCount = tClazzMapper.clazzSelectCount();
		List<TClazz> clazzSelect = tClazzMapper.clazzSelect(pageSize, a, userid);
		layUITableBean =new LayUITableBean<TClazz>();
		layUITableBean.setCount(clazzSelectCount);
		layUITableBean.setData(clazzSelect);
		return layUITableBean;
	}
	@Override
	public Integer clazzUpdate(String userId) {
		if(userId!=null&&"".equals(userId)) {
			return -1;
		}
		Integer clazzUpdate = tClazzMapper.clazzUpdate(userId);
		return clazzUpdate;
	}
	

}
