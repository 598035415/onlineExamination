package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.TQuestion;
import com.ssm.pojo.TQuestionCategory;
import org.apache.ibatis.annotations.Param;

public interface TQuestionCategoryMapper {
	
	List<TQuestionCategory> selectCategoryByParentId(Integer categoryId);

	List<TQuestionCategory> getProblemSetList(@Param("parentId") Integer parentId, 
			@Param("page")Integer page, @Param("limit")Integer limit);

	Integer problemSetCount();

	List<TQuestionCategory> problemListCategory(@Param("controllerId")String controllerId);

}
