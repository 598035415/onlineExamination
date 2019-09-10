package com.ssm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.ServerResponse;
import com.ssm.pojo.TUser;
import com.ssm.service.StudentService;
import com.ssm.util.LayUITableBean;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	/**
	 * 带班级Id查询学生
	 * @param userid
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/pageTranspond")
	public String PageTranspond(String clazzId,HttpServletRequest request) throws ServletException, IOException {
		request.setAttribute("userid",clazzId);
		return "WeAdmin/pages/student/studentPage.jsp";
	}
	/**
	 * user学生查询
	 * @param clazzId
	 * @return
	 */
	@RequestMapping("/StudentSelect")
	@ResponseBody
	public LayUITableBean<TUser> StudentSelect(String clazzId,Integer limit,Integer page){
		LayUITableBean<TUser> studentSelect = studentService.StudentSelect(clazzId,limit,page);
		if(studentSelect!=null) {
			return studentSelect;
		}
		return null;
	}
	/**
	 * 学生删除
	 * @param userid
	 * @return
	 */
	@RequestMapping("/StudentDelete")
	@ResponseBody
	public ServerResponse<TUser> StudentDelete(String userid){
		Integer studentDelete = studentService.StudentDelete(userid);
		if(studentDelete!=0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}
	/**
	 * 页面转发
	 * @param request
	 * @param clazzId
	 * @return
	 */
	@RequestMapping("/StudentAddPage")
	public String StudentAddPage(HttpServletRequest request,String clazzId) {
		request.setAttribute("clazzId",clazzId);
		return "WeAdmin/pages/student/studentAdd.jsp";
	}
	
	@RequestMapping("/StudentInsert")
	@ResponseBody
	public ServerResponse<TUser> StudentAdd(TUser tUser){
		Integer studentAdd = studentService.StudentAdd(tUser);
		if(studentAdd!=0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}
	/**
	 * 修改前查询数据
	 * @param id
	 * @param m
	 * @return
	 */
	@RequestMapping("/updateSelect")
	public String updateStudentSelect(String id,Model m) {
		TUser updateSelect = studentService.updateSelect(id);
		m.addAttribute("updateSelectList",updateSelect);
		return "WeAdmin/pages/student/StudentUpdate.jsp";
	}
	/***
	 * 修改学生信息
	 * @param tUser
	 * @return
	 */
	@RequestMapping("/studentUpdate")
	@ResponseBody
	public ServerResponse<TUser> studentUpdate(TUser tUser){
		Integer studentUpdate = studentService.studentUpdate(tUser);
		if(studentUpdate!=0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}
}
