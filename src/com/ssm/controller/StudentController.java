package com.ssm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	 * 
	 * @param userid
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/pageTranspond")
	public String PageTranspond(String userid,HttpServletRequest request) throws ServletException, IOException {
		request.setAttribute("userid",userid);
		return "WeAdmin/pages/student/studentPage.jsp";
	}
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
	@RequestMapping("/StudentDelete")
	@ResponseBody
	public ServerResponse<TUser> StudentDelete(String userid){
		Integer studentDelete = studentService.StudentDelete(userid);
		if(studentDelete!=0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}
	@RequestMapping("/StudentAddPage")
	public String StudentAddPage(HttpServletRequest request,String classId) {
		request.setAttribute("clazzId",classId);
		return "WeAdmin/pages/student/studentAdd.jsp";
	}
	
	@RequestMapping("/StudentAdd")
	@ResponseBody
	public ServerResponse<TUser> StudentAdd(TUser tUser){
		Integer studentAdd = studentService.StudentAdd(tUser);
		if(studentAdd!=0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}
}
