package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.ServerResponse;
import com.ssm.pojo.TClazz;
import com.ssm.pojo.TUser;
import com.ssm.service.ClazzService;
import com.ssm.service.StudentService;
import com.ssm.util.LayUITableBean;

@Controller
public class ClazzController {
	@Autowired
	private ClazzService clazzService;
	@Autowired
	private StudentService studentService;
	@RequestMapping("/clazzSelect")
	@ResponseBody
	public LayUITableBean<TClazz> clazzSelect(Integer limit,Integer page,String userid) {
		LayUITableBean<TClazz> clazzSelect = clazzService.clazzSelect(limit, page, userid);
		if (clazzSelect!=null) {
			return clazzSelect;
		}
		return null;
	}
	/**
	 * 班级删除
	 * @param userId
	 * @return
	 */
	@RequestMapping("/clazzUpdate")
	@ResponseBody
	public ServerResponse<TClazz> clazzDelete(String userId){
		Integer clazzUpdate = clazzService.clazzDelete(userId);
		if(clazzUpdate!=-1||clazzUpdate>0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}
	@RequestMapping("/clazzAddPageResponse")
	public String clazzPageResponse(String userId,HttpServletRequest request) {
		request.setAttribute("userId",userId);
		return "/clazz/clazzAdd";
	}
	/**
	 * 教师增加班级
	 * @param clazzName
	 * @param userId
	 * @param createTimes
	 * @return
	 */
	@RequestMapping("/clazzAdd")
	@ResponseBody
	public ServerResponse<TClazz> clazzAdd(String clazzName, String userId, String createTimes){
		Integer clazzAdd = clazzService.clazzAdd(clazzName, userId, createTimes);
		if(clazzAdd!=0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}
	/***
	 * 班级修改查询
	 * @param clazzId
	 * @param request
	 * @return
	 */
	@RequestMapping("/clazzUpdateSelect")
	public String clazzUpdateSelect(String clazzId,HttpServletRequest request) {
		TClazz clazzUpdateSelect = clazzService.clazzUpdateSelect(clazzId);
		System.out.println("班级信息"+clazzUpdateSelect);
		request.setAttribute("clazzList",clazzUpdateSelect);
		request.setAttribute("id", clazzId);
		return "/clazz/clazzUpdate";
	}
	@RequestMapping("/updateClazz")
	@ResponseBody
	public ServerResponse<TClazz> clazzUpdate(TClazz tClazz){
		Integer clazzUpdate = clazzService.clazzUpdate(tClazz);
		if(clazzUpdate!=0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}
	/**
	 * 管理员查询班级
	 * @param limit
	 * @param page
	 * @return
	 */
	@RequestMapping("/adminClazzSelect")
	@ResponseBody
	public LayUITableBean<TClazz> adminClazzSelect(Integer limit,Integer page){
		LayUITableBean<TClazz> adminClazzSelect = clazzService.adminClazzSelect(limit, page);
		if(adminClazzSelect!=null) {
			return adminClazzSelect;
		}
		return null;
	}
	/**
	 * 管理员增加转发页面
	 * @param request
	 * @return
	 */
	@RequestMapping("teacherSelect")
	public String teacherSelect(HttpServletRequest request) {
		List<TUser> teacherSelect = studentService.teacherSelect();
		request.setAttribute("teacherSelectList", teacherSelect);
		return "/clazz/adminClazzAdd";
	}
}
