package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public LayUITableBean<TUser> StudentSelect(String clazzId,String limit,String page) {
		if(clazzId==null&&"".equals(clazzId)) {
			return null;
		}
		int parseInt = Integer.parseInt(limit);
		int parseInt2 = Integer.parseInt(page);
		int pageIndex=(parseInt2-1)*parseInt;
		Long studentCountSelect = tUserStudentMapper.StudentCountSelect();
		List<TUser> studentSelect = tUserStudentMapper.StudentSelect(clazzId,parseInt,pageIndex);
		layUITableBean =new LayUITableBean<TUser>();
		System.out.println("11111111111学生总数"+studentCountSelect);
		layUITableBean.setCount(studentCountSelect);
		layUITableBean.setData(studentSelect);
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
