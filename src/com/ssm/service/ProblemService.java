package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TQuestion;
import com.ssm.pojo.TQuestionCategory;
import com.ssm.util.LayUITableBean;

public interface ProblemService {

	List<TQuestionCategory> getProblemSetList(Integer page, Integer limit);

	Integer problemSetCount();

	List<TQuestionCategory> problemListCategory(String controllerId);

	LayUITableBean<TQuestion> problemListTable(String categoryId, Integer page, Integer limit, String keyword, String questionCategory);
	
}
