package com.ssm.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssm.common.GlobalSessionUser;
import com.ssm.pojo.TUser;
import com.ssm.service.PersonalCenterService;


@Controller
public class PersonalCenterController {
	
	@Autowired
	private PersonalCenterService personalCenterService; 
	
	@RequestMapping("/updateUser")
	@ResponseBody
	public Map<String, Object> updateUser(HttpServletRequest req, Integer gender, String birthday) throws ParseException {
		TUser user = (TUser) req.getSession().getAttribute(GlobalSessionUser.preCurrentUser.toString());
		Map<String,Object> map = new HashMap<String, Object>();
		System.out.println(birthday);
		if (user == null) {
			map.put("error", "非法访问");
		}
		String updateUser = personalCenterService.updateUser(user.getId(), gender.toString(), birthday);
		if ("success".equals(updateUser)) {
			user.setGender(gender);
			SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
			user.setBirthday(sdf.parse(birthday));
			map.put("success", "修改成功");
			return map;
		}
		map.put("error", "修改失敗");
		return map;
	}
	
	@RequestMapping("/updatePassword")
	@ResponseBody
	public Map<String, Object> updatePassword(HttpServletRequest req,HttpServletResponse response, String oldPassword, String newPassword, String confirmNewPassword) throws UnsupportedEncodingException {
		TUser user = (TUser) req.getSession().getAttribute(GlobalSessionUser.preCurrentUser.toString());
		Map<String,Object> map = new HashMap<String, Object>();
		if (user == null) {
			map.put("error", "非法访问");
			return map;
		}
		System.out.println(oldPassword);
		System.out.println(newPassword);
		System.out.println(confirmNewPassword);
		System.out.println(user.getPassword());
		if (!user.getPassword().equals(oldPassword)) {
			map.put("error", "旧密码输入错误");
			return map;
		}else if(newPassword.equals(user.getPassword())) {
			map.put("error", "与老密码相同");
			return map;
		}else if (newPassword.length() < 6) {
			map.put("error", "新密码长度必须大于6位");
			return map;
		}else if (!confirmNewPassword.equals(newPassword)) {
			map.put("error", "两次密码不同");
			return map;
		}
		String updatePassword = personalCenterService.updatePassword(user.getId(), newPassword);
		map.put("success", updatePassword);
		return map;
	}
	
	@RequestMapping("/headPortrait")
	@ResponseBody
	public Map<String, Object> headPortrait(@RequestParam(required=false)MultipartFile file, HttpServletRequest req) throws IllegalStateException, IOException {
		Map<String,Object> map = new HashMap<String, Object>();
		if (file == null) {
			map.put("msg", "接口异常");
			return map;
		}
//		System.out.println("------------------------------------------------------------");
		String path = req.getServletContext().getRealPath("/OnLine/img");
//		System.out.println(path);
		String fileName = file.getOriginalFilename();
	    // 创建文件实例
	    File filePath = new File(path, fileName);
	    // 如果文件目录不存在，创建目录
	    if (!filePath.getParentFile().exists()) {
	        filePath.getParentFile().mkdirs();
	        System.out.println("创建目录" + filePath);
	    }
	    // 写入文件
	    file.transferTo(filePath);
		TUser user = (TUser) req.getSession().getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(user == null) {
			map.put("msg", "非法访问");
			return map;
		}
		String updateHeadPortrait = personalCenterService.updateHeadPortrait(user.getId(),fileName);
		if ("success".equals(updateHeadPortrait)) {
			map.put("msg", "上传成功");
			user.setHeadPortrait(fileName);
		}else {
			map.put("msg", "上传失败");
		}
		return map;
	}
	
	@RequestMapping("/myExerciseLineChart")
	@ResponseBody
	public Map<String, Object> myExerciseLineChart(HttpServletRequest req){
		Map<String, Object> map = new HashMap<String, Object>();
		TUser user = (TUser) req.getSession().getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if (user == null) {
			return null;
		}
		return personalCenterService.getExercise(user.getId());
	}
	
	@RequestMapping("/myExamLineChart")
	@ResponseBody
	public Map<String, Object> myExamLineChart(HttpServletRequest req){
		TUser user = (TUser) req.getSession().getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if (user == null) {
			return null;
		}
		return personalCenterService.getMyExam(user.getId());
	}
	
}
