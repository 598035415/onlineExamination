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
	List<TClazz> clazzSelect(@Param("limit")Integer limit,@Param("page")Integer page,@Param("userid")String userid);
	/**
	 * 查询班级总数
	 * @return
	 */
	Long clazzSelectCount();
	/**
	 * 班级删除
	 * @param userId
	 * @return
	 */
	Integer clazzUpdate(String userId);
}