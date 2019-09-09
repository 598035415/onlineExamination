package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.pojo.TRole;
import com.ssm.service.TRoleManagerService;

@Controller
public class TRoleManagerController {
	@Autowired
	private TRoleManagerService service;
	
	@RequestMapping("selectAllRole")
	@ResponseBody
	public List<TRole> selectAllRole(){
		return service.selectAllRole();
	}
}
