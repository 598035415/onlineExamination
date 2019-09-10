package com.ssm.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TExamPaperMapper;
import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPublish;
import com.ssm.service.ExamPaperService;

@Service
public class TExamPaperServiceImpl implements ExamPaperService {
	@Autowired
	private TExamPaperMapper tExamPaperMapper;
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

	
	
	
	
	
}
