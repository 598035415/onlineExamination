package com.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.LWQuestionMapper;
import com.ssm.dao.TQuestionCategoryMapper;
import com.ssm.pojo.TQuestion;
import com.ssm.pojo.TQuestionCategory;
import com.ssm.service.ProblemService;
import com.ssm.util.LayUITableBean;
import com.ssm.vo.ProblemDetailVO;

@Service
public class ProblemServiceImpl implements ProblemService {

	@Autowired
	private TQuestionCategoryMapper tQuestionCategoryMapper;
	
	@Autowired
	private LWQuestionMapper lwQuestionMapper;

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
		Map<String, Object> map = new HashMap<>();
		map.put("categoryId", categoryId);
		map.put("page", page);
		map.put("limit", limit);
		map.put("keyword", keyword);
		map.put("questionCategory", questionCategory);
		List<TQuestion> list = lwQuestionMapper.problemListTable(map);
		
		Map<String, Object> map2 = new HashMap<>();
		Integer count = lwQuestionMapper.problemListTableCount(map2);
		layUITableBean.setCount(new Long(count));
		layUITableBean.setData(list);
		return layUITableBean;
	}

	@Override
	public ProblemDetailVO problemdetailQuery(String problemId) {
		List<ProblemDetailVO> list = lwQuestionMapper.problemdetailQuery(problemId);
		if (null != list && list.size() > 0) {
			for (ProblemDetailVO problemDetailVO : list) {
				System.out.println(problemDetailVO);
			}
//			return list.get(0);
		}
		return null;
	}

	
}
