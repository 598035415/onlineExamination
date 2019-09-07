package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TQuestionCategory;

public interface ProblemService {

	List<TQuestionCategory> getProblemSetList(Integer page, Integer limit);

	Integer problemSetCount();
	
}
