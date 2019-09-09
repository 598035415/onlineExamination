package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TQuestionCategoryMapper;
import com.ssm.pojo.TQuestion;
import com.ssm.pojo.TQuestionCategory;
import com.ssm.service.ProblemService;
import com.ssm.util.LayUITableBean;

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

	@Override
	public List<TQuestionCategory> problemListCategory(String controllerId) {
		return tQuestionCategoryMapper.problemListCategory(controllerId);
	}

	@Override
	public LayUITableBean<TQuestion> problemListTable(String categoryId, Integer page, Integer limit, String keyword,
			String questionCategory) {
		LayUITableBean<TQuestion> layUITableBean = new LayUITableBean<TQuestion>();
		List<TQuestion> list = tQuestionCategoryMapper.problemListTable(categoryId, page, limit, keyword,
				questionCategory);
		return null;
	}

}
