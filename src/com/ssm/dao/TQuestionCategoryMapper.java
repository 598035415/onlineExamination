package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TQuestionCategory;

public interface TQuestionCategoryMapper {

	List<TQuestionCategory> getProblemSetList(@Param("parentId") Integer parentId, 
			@Param("page")Integer page, @Param("limit")Integer limit);

	Integer problemSetCount();

}
