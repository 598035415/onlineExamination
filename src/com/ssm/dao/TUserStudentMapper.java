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
	 * @return
	 */
	List<TUser> StudentSelect(@Param("clazzId")String clazzId);
	/**
	 * 学生删除
	 * @param userid
	 * @return
	 */
	Integer StudentDelete(String userid);
	
	/**
	 *  *用户学生增加
	 * @param tUser
	 * @return
	 */
	Integer StudentAdd(TUser tUser);
	/**
	 * *教师查询
	 * @return
	 */
	List<TUser> teacherSelect();
	
}
