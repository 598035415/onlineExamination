package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPublish;
import com.ssm.vo.ExamPaperVo;

/**
 *   试卷管理
 * @author LJJ
 *
 */
public interface TExamPaperMapper {
	/***
	 * 	查询试卷
	 * @return
	 */
	
	List<TExamPaper> selectTExamPaper();
	/**
	 **      发布任务
	 * @param examPublish
	 * @return
	 */
	Integer missionAdd(TExamPublish examPublish);
	
	List<ExamPaperVo> selectExamPaperList();
	
	Integer addExamPaper(TExamPaper examPaper);
}