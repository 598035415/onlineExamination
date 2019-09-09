package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.TUserStudentMapper;
import com.ssm.pojo.TUser;
import com.ssm.service.StudentService;
import com.ssm.util.LayUITableBean;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private TUserStudentMapper tUserStudentMapper;
	private LayUITableBean<TUser> layUITableBean;
	@Override
	public LayUITableBean<TUser> StudentSelect(String clazzId,Integer limit,Integer page) {
		if(clazzId==null&&"".equals(clazzId)) {
			return null;
		}
		PageHelper.startPage(page,limit);
		PageInfo<TUser> pageInfo=new PageInfo<TUser>(tUserStudentMapper.StudentSelect(clazzId));
		layUITableBean =new LayUITableBean<TUser>();
		layUITableBean.setCount(pageInfo.getTotal());
		layUITableBean.setData(pageInfo.getList());
		return layUITableBean;
	}
	/**
	 * 学生删除
	 */
	@Override
	public Integer StudentDelete(String userid) {
		if(userid==null&&"".equals(userid)) {
			return 0;
		}
		Integer studentDelete = tUserStudentMapper.StudentDelete(userid);
		if(studentDelete!=0) {
			return studentDelete;
		}
		return 0;
	}
	/**
	 * 学生增加
	 */
	@Override
	public Integer StudentAdd(TUser tUser) {
		if(tUser==null) {
			return 0;
		}
		Integer studentAdd = tUserStudentMapper.StudentAdd(tUser);
		if(studentAdd>0) {
			return studentAdd;
		}
		return null;
	}

}
