package com.ssm.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.common.ServerResponse;
import com.ssm.dao.TExamPaperMapper;
import com.ssm.dao.TExamPaperQuestionMapper;
import com.ssm.dao.TQuestionMapper;
import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPaperQuestion;
import com.ssm.pojo.TExamPublish;
import com.ssm.pojo.TQuestion;
import com.ssm.service.ExamPaperService;
import com.ssm.util.LayUIPageBean;
import com.ssm.util.ResponseCode;
import com.ssm.vo.ExamPaperQuestionVo;
import com.ssm.vo.ExamPaperVo;
import com.ssm.vo.QuestionVo;
import com.ssm.vo.LJJPerformanceVo;
import com.ssm.vo.LJJTackPaperVo;

@Service
public class TExamPaperServiceImpl implements ExamPaperService {
	@Autowired
	private TExamPaperMapper tExamPaperMapper;
	
	@Autowired
	private TQuestionMapper questionMapper;
	
	@Autowired
	private TExamPaperQuestionMapper examPaperQuestionMapper;
	/**
	 *  查询试卷
	 */
	@Override
	public List<TExamPaper> selectTExamPaper() {
		List<TExamPaper> selectTExamPaper = tExamPaperMapper.selectTExamPaper();
		return selectTExamPaper;

	}
	/**
	 * 	考试发布任务增加 
	 */
	@Override
	public Integer missionAdd(TExamPublish examPublish) {
		if(examPublish==null) {
			return 0;
		}
		if(examPublish.getStartTimes()==null&&!("".equals(examPublish.getStartTimes()))) {
			return 0;
		}
		if(examPublish.getExamId()<=0) {
			return 0;
		}
		DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date parse=null;
		Date parse2 = null;
		Date parse3=null;
		Date date=new Date();
		//当前时间
		String format = df1.format(date);
		try{
			//当前时间
			parse= df1.parse(format);
			//传入时间
			parse2 = df1.parse(examPublish.getStartTimes());
			//结束时间
			parse3 = df1.parse(examPublish.getEndTimes());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		/*传入时间*/
		long time = parse2.getTime();
		/*当前时间*/
		long time2 = parse.getTime();
		//结束时间
		long time3 = parse3.getTime();
		if(time>time3) {
			return 745;
		}
		if(time2<time) {
			examPublish.setCurrentType(1);
		}
		if(time2>time&&time2<time3) {
			examPublish.setCurrentType(2);
		}
		if(time2>time3) {
			examPublish.setCurrentType(3);
		}
		Integer missionAdd = tExamPaperMapper.missionAdd(examPublish);
		if(missionAdd>0) {
			return missionAdd;
		}
		return 0;
	}

	@Override
	public List<LJJTackPaperVo> selectTask(String clazzId) {
		if(clazzId==null) {
			return null;
		}
		List<LJJTackPaperVo> selectTask = tExamPaperMapper.selectTask(clazzId);
		
		return selectTask;
	}
	@Override
	public List<LJJPerformanceVo> selectPerformance(String tackId) {
		if(tackId==null&&"".equals(tackId)) {
			return null;
		}
		List<LJJPerformanceVo> selectPerformance = tExamPaperMapper.selectPerformance(tackId);
		return selectPerformance;
	}

	@Transactional(rollbackFor = Exception.class, readOnly = true, propagation = Propagation.SUPPORTS)
	@Override
	public PageInfo<ExamPaperVo> selectExamPaperList(Integer pageNum, Integer pageSize) {
		if ((pageNum == null || pageNum.intValue() == 0) || (pageSize == null || pageSize.intValue() == 0)) {
			return null;
		}
		// 通过分页插件查询出分页的数据
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<ExamPaperVo> pageInfo = new PageInfo<>(tExamPaperMapper.selectExamPaperList());
		// 返回结果集
		return pageInfo;
	}
	
	@Transactional(rollbackFor = Exception.class, readOnly = true, propagation = Propagation.SUPPORTS)
	@Override
	public List<TQuestion> selectIdQuestionContent(){
		return questionMapper.selectIdQuestionContent();
	}
	
	/**
	 * 添加试卷
	 */
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	@Override
	public ServerResponse addExamPaper(TExamPaper examPaper, Integer[] questionIdArr) {
		if (examPaper == null || questionIdArr.length < 1) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
		}
		tExamPaperMapper.addExamPaper(examPaper);
		for (Integer questionId : questionIdArr) {
			examPaperQuestionMapper.addExamPaperQuestion(examPaper.getId(), questionId);
		}
		return ServerResponse.createBySuccess();
	}
	
	@Transactional(rollbackFor = Exception.class, readOnly = true, propagation = Propagation.SUPPORTS)
	@Override
	public List<ExamPaperQuestionVo> selectExamPaperInfoById(Integer examPaperId) {
		if (examPaperId == null || examPaperId.intValue() < 1) {
			return null;
		}
		return examPaperQuestionMapper.selectExamPaperInfoById(examPaperId);
	}
	
}
