package com.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.pojo.TUser;
import com.ssm.service.StudentService;
import com.ssm.util.LayUITableBean;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	/**
	 * user学生查询
	 * @param clazzId
	 * @return
	 */
	@RequestMapping("/StudentSelect")
	@ResponseBody
	public LayUITableBean<TUser> StudentSelect(String clazzId,String limit,String page){
		LayUITableBean<TUser> studentSelect = studentService.StudentSelect(clazzId,limit,page);
		if(studentSelect!=null) {
			return studentSelect;
		}
		return null;
	}
}
