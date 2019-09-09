package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ssm.pojo.TUser;

@Repository
public interface TUserStudentMapper {
	/**
	 * 学生查询
	 * @param clazzId
	 * @param limit
	 * @param page
	 * @return
	 */
	List<TUser> StudentSelect(@Param("clazzId")String clazzId,@Param("limit")Integer limit,@Param("page")Integer page);
	/**
	 * 查询总记录数
	 * @return
	 */
	Long StudentCountSelect();
	/**
	 * 学生删除
	 * @param userid
	 * @return
	 */
	Integer StudentDelete(String userid);
	
	/**
	 * 学生增加
	 * @param tUser
	 * @return
	 */
	Integer StudentAdd(TUser tUser);
	
	
}
