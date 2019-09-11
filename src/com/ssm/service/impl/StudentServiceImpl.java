package com.ssm.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
		if(tUser.getCreateTimes()==null) {
			Date date=new Date();
			DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String format = dateFormat.format(date);
			tUser.setCreateTimes(format);
		}
		Integer studentAdd = tUserStudentMapper.StudentAdd(tUser);
		if(studentAdd>0) {
			return studentAdd;
		}
		return null;
	}
	/**
	 * 用户教师查询
	 */
	@Override
	public List<TUser> teacherSelect() {
		List<TUser> teacherSelect = tUserStudentMapper.teacherSelect();
		return teacherSelect;
	}
	/**
	 * 修改学生查询
	 */
	@Override
	public TUser updateSelect(String id) {
		if(id==null&&"".equals(id)) {
			return null;
		}
		TUser updateSelect = tUserStudentMapper.updateSelect(id);
		if(updateSelect!=null) {
			return updateSelect;			
		}
		return null;
	}
	/**
	 * 学生修改
	 */
	@Override
	public Integer studentUpdate(TUser tUser) {
		if(tUser==null) {
			return 0;
		}
		if(tUser.getUpdateTimes()==null) {
			Date date=new Date();
			DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String format = dateFormat.format(date);
			tUser.setUpdateTimes(format);
		}
		Integer studentUpdate = tUserStudentMapper.studentUpdate(tUser);
		if(studentUpdate!=0) {
			return studentUpdate;
		}
		return 0;
	}

}
