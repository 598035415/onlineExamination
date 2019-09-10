package com.ssm.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.ssm.common.ServerResponse;
import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPublish;
import com.ssm.pojo.TQuestion;
import com.ssm.util.LayUIPageBean;
import com.ssm.vo.ExamPaperVo;

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
}
