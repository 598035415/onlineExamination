package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TQuestionCategoryMapper;
import com.ssm.pojo.TQuestionCategory;
import com.ssm.service.ProblemService;

@Service
public class ProblemServiceImpl implements ProblemService {

	@Autowired
	private TQuestionCategoryMapper tQuestionCategoryMapper;
	
	@Override
	public List<TQuestionCategory> getProblemSetList(Integer page, Integer limit) {
		List<TQuestionCategory> list = tQuestionCategoryMapper.getProblemSetList(0, page, limit);
		return list;
	}

	@Override
	public Integer problemSetCount() {

		return tQuestionCategoryMapper.problemSetCount();
	}

	
}
