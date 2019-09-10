package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ssm.pojo.TClazz;

@Repository
public interface TClazzMapper {
	/**
	 * 分页查询
	 * @return
	 */
	List<TClazz> clazzSelect(@Param("userid")String userid);
	/**
	 * 查询班级总数
	 * @return
	 */
	List<TClazz> clazzSelectCount();
	/**
	 * 班级删除
	 * @param userId
	 * @return
	 */
	Integer clazzUpdate(String userId);
	/**
	 * 班级增加
	 * @param clazzName
	 * @param userId
	 * @param createTimes
	 * @return
	 */
	Integer clazzInsert(@Param("clazzName")String clazzName,@Param("userId")String userId,@Param("createTimes")String createTimes);
	/**
	 *  *   管理员查询班级
	 * @return
	 */
	List<TClazz> adminClazzSelect();
}