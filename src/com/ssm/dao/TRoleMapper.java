package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TRole;

public interface TRoleMapper {
	List<TRole> selectAllRole();
	
	List<TRole> queryAllRole();
	
	Integer addRole(TRole role);
	
	TRole selectByRoleName(@Param("roleName")String roleName);
	
	Integer addRoleMenu(@Param("menuId")String menuId,@Param("roleId")String roleId);
	
	Integer deleteRole(@Param("id")String Id);
}