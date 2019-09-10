package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPublish;
import com.ssm.vo.LJJPerformanceVo;
import com.ssm.vo.LJJTackPaperVo;

/**
 * 试卷管理
 * @author LJJ
 *
 */
public interface ExamPaperService {
	List<TExamPaper> selectTExamPaper();
	
	Integer missionAdd(TExamPublish examPublish);
	
	List<LJJTackPaperVo> selectTask(String clazzId);
	
	List<LJJPerformanceVo> selectPerformance(String tackId);
}
