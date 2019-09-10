package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPublish;

/**
 * 试卷管理
 * @author LJJ
 *
 */
public interface ExamPaperService {
	List<TExamPaper> selectTExamPaper();
	
	Integer missionAdd(TExamPublish examPublish);
}
