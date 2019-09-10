package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.pojo.TRole;
import com.ssm.service.TRoleManagerService;
import com.ssm.util.ResponseEntity;

@Controller
public class TRoleManagerController {
	@Autowired
	private TRoleManagerService service;
	
	@RequestMapping("selectAllRole")
	@ResponseBody
	public List<TRole> selectAllRole(){
		return service.selectAllRole();
	}
	
	@RequestMapping("roleQuery")
	public String roleQuery(HttpServletRequest request){
		 List<TRole> selectAllRole = service.selectAllRole();
		 request.setAttribute("roleList", selectAllRole);
		return "WeAdmin/pages/admin/role.jsp";
	}
	
	@RequestMapping("addRole")
	@ResponseBody
	public ResponseEntity<TRole> addRole(String [] menuIds,String roleName){
		ResponseEntity<TRole> addRole = service.addRole(menuIds, roleName);
		return addRole;
	}
	
	@RequestMapping("deleteRole")
	@ResponseBody
	public ResponseEntity<TRole> deleteRole(String roleId){
		ResponseEntity<TRole> addRole = service.deleteRole(roleId);
		return addRole;
	}
}
