package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.TQuestionCategory;

public interface TQuestionCategoryMapper {
	List<TQuestionCategory> selectCategoryById(Integer categoryId);
	
	List<TQuestionCategory> selectCategoryByParentId(Integer categoryId);
}
