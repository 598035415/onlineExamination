package com.ssm.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
	public LayUITableBean<TClazz> clazzSelect(Integer limit, Integer page, String userid) {
		if(userid!=null&&"".equals(userid)) {
			return null;
		}
		PageHelper.startPage(page,limit);
		PageInfo<TClazz> pageInfo=new PageInfo<TClazz>(tClazzMapper.clazzSelect(userid));
		layUITableBean =new LayUITableBean<TClazz>();
		layUITableBean.setData(pageInfo.getList());
		layUITableBean.setCount(pageInfo.getTotal());
		return layUITableBean;
	}
	@Override
	public Integer clazzDelete(String userId) {
		if(userId!=null&&"".equals(userId)) {
			return -1;
		}
		Integer clazzUpdate = tClazzMapper.clazzDelete(userId);
		if(clazzUpdate!=-1) {
			return clazzUpdate;
		}
		return -1;
	}
	/**
	 *  班级增加
	 */
	@Override
	public Integer clazzAdd(String clazzName, String userId, String createTimes) {
		if(clazzName==null&&"".equals(clazzName)) {
			return 0;
		}
		if(userId==null&&"".equals(userId)) {
			return 0;
		}
		if(createTimes==null) {
			Date date=new Date();
			DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String format = dateFormat.format(date);
			createTimes=format;
		}
		Integer clazzInsert = tClazzMapper.clazzInsert(clazzName, userId, createTimes);
		if(clazzInsert>0) {
			return 1;
		}
		return null;
	}
	/**
	 * 管理员查询班级
	 */
	@Override
	public LayUITableBean<TClazz> adminClazzSelect(Integer limit, Integer page) {
		PageHelper.startPage(page,limit);
		PageInfo<TClazz> pageInfo=new PageInfo<TClazz>(tClazzMapper.adminClazzSelect());
		layUITableBean =new LayUITableBean<TClazz>();
		layUITableBean.setData(pageInfo.getList());
		layUITableBean.setCount(pageInfo.getTotal());
		return layUITableBean;
	}
	/***
	 * 班级修改
	 */
	@Override
	public Integer clazzUpdate(TClazz tClazz) {
		if(tClazz==null) {
			return 0;
		}
		if(tClazz.getUpdateTimes()==null) {
			Date date=new Date();
			DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String format = dateFormat.format(date);
			tClazz.setUpdateTimes(format);
		}
		Integer clazzUpdate = tClazzMapper.clazzUpdate(tClazz);
		if(clazzUpdate>0) {
			return clazzUpdate;
		}
		return 0;
	}
	/***
	 * 班级修改查询
	 */
	@Override
	public TClazz clazzUpdateSelect(String clazzId) {
		if(clazzId==null&&"".equals(clazzId)) {
			return null;
		}
		TClazz clazzUpdateSelect = tClazzMapper.clazzUpdateSelect(clazzId);
		if(clazzUpdateSelect!=null) {
			return clazzUpdateSelect;
		}
		return null;
	}
	

}
