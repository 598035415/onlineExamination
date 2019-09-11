package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPublish;
import com.ssm.vo.ExamPaperVo;
import com.ssm.vo.LJJPerformanceVo;
import com.ssm.vo.LJJTackPaperVo;

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
	/**
	 * 查询任务匹配的试卷
	 * @param clazzId
	 * @return
	 */
	List<LJJTackPaperVo> selectTask(String clazzId);
	/***
	 * 查询成绩
	 * @param tackId
	 * @return
	 */
	List<LJJPerformanceVo> selectPerformance(String tackId);
	
	Integer updateEamPaper(TExamPaper examPaper);
	
	Integer deleteExamById(Integer[] examIds);
	
	Integer updateExamPaperById(@Param("id") Integer id, @Param("status") Integer status);
}