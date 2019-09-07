package com.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.ServerResponse;
import com.ssm.pojo.TClazz;
import com.ssm.service.ClazzService;
import com.ssm.util.LayUITableBean;

@Controller
public class ClazzController {
	@Autowired
	private ClazzService clazzService;
	@RequestMapping("/clazzSelect")
	@ResponseBody
	public LayUITableBean<TClazz> clazzSelect(String limit,String page,String userid) {
		LayUITableBean<TClazz> clazzSelect = clazzService.clazzSelect(limit, page, userid);
		if (clazzSelect!=null) {
			return clazzSelect;
		}
		return null;
	}
	@RequestMapping("/clazzUpdate")
	@ResponseBody
	public ServerResponse<TClazz> clazzUpdate(String userId){
		Integer clazzUpdate = clazzService.clazzUpdate(userId);
		if(clazzUpdate!=-1||clazzUpdate>0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}
	public ServerResponse<TClazz> clazzAdd(String clazzName,String user_id){
		
		return ServerResponse.createByError();
	}
}
