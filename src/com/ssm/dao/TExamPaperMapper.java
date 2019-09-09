package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.TExamPaper;

/**
 *   试卷管理
 * @author ljj
 *
 */
public interface TExamPaperMapper {
	/***
	 * 	查询试卷
	 * @return
	 */
	
	List<TExamPaper> selectTExamPaper();
}