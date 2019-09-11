package com.ssm.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.ssm.common.ServerResponse;
import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPaperQuestion;
import com.ssm.pojo.TExamPublish;
import com.ssm.pojo.TQuestion;
import com.ssm.util.LayUIPageBean;
import com.ssm.vo.ExamPaperQuestionVo;
import com.ssm.vo.ExamPaperVo;
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
	
	PageInfo<ExamPaperVo> selectExamPaperList(Integer pageNum, Integer pageSize);
	
	List<TQuestion> selectIdQuestionContent();
	
	ServerResponse addExamPaper(TExamPaper examPaper, Integer[] questionIdArr);

	List<LJJTackPaperVo> selectTask(String clazzId);
	
	List<LJJPerformanceVo> selectPerformance(String tackId);
	
	List<ExamPaperQuestionVo> selectExamPaperInfoById(Integer examPaperId);
}
