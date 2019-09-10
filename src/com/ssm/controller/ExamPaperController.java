package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.ServerResponse;
import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPublish;
import com.ssm.service.ExamPaperService;

@Controller
public class ExamPaperController {
	@Autowired
	private ExamPaperService examPaperService;
	/**
	 * 查询试卷和转发页面
	 * @param clazzId
	 * @param request
	 * @return
	 */
	@RequestMapping("/innerExamPage")
	public String innerExamPage(String clazzId,HttpServletRequest request) {
		request.setAttribute("clazzId",clazzId);
		List<TExamPaper> selectTExamPaper = examPaperService.selectTExamPaper();
		if(selectTExamPaper!=null) {
			request.setAttribute("examPaperList",selectTExamPaper);
			return "WeAdmin/pages/examination/examinationPage.jsp";
		}
		return null;
	}
	
	/**
	 * 查询试卷
	 * @param limit
	 * @param page
	 * @return
	 */
	@RequestMapping("selectTExamPaper")
	@ResponseBody
	public List<TExamPaper> examPaperSelect(){
		List<TExamPaper> selectTExamPaper = examPaperService.selectTExamPaper();
		if(selectTExamPaper!=null) {
			return selectTExamPaper;
		}
		return null;
	}
	/**
	 *    发布任务
	 * @param tExamPublish
	 * @return
	 */
	@RequestMapping("/missionAdd")
	@ResponseBody
	public ServerResponse<TExamPublish> missionAdd(TExamPublish tExamPublish){
		Integer missionAdd = examPaperService.missionAdd(tExamPublish);
		if(missionAdd==745) {
			return ServerResponse.createByErrorCodeMessage(745,"开始时间必须小于结束时间");
		}
		if(missionAdd>0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByError();
	}
}
