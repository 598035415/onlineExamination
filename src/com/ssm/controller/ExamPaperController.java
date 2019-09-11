package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.ServerResponse;
import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPaperQuestion;
import com.ssm.pojo.TExamPublish;
import com.ssm.service.ExamPaperService;
import com.ssm.service.IQuestionService;
import com.ssm.util.LayUIPageBean;
import com.ssm.vo.ExamPaperQuestionVo;
import com.ssm.vo.LJJPerformanceVo;
import com.ssm.vo.LJJTackPaperVo;

@Controller
public class ExamPaperController {
	@Autowired
	private ExamPaperService examPaperService;
	
	@Autowired
	private IQuestionService questionService;
	
	private static final Integer QUESTION_CATEGORY_PARENT_ID = 0;//选择题类目
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
			return "/examination/examinationPage";
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
	
	/***
	 * 查询试卷转发页面
	 * @param clazzId
	 * @param request
	 * @return
	 */
	@RequestMapping("/selectTask")
	public String selectTask(String clazzId,HttpServletRequest request){
		List<LJJTackPaperVo> selectTask = examPaperService.selectTask(clazzId);
		request.setAttribute("selectTaskList",selectTask);
		return "/clazz/performance";
	}
	
	/***
	 * 查询成绩
	 * @param tackId
	 * @return
	 */
	@RequestMapping("/selectPerformance")
	@ResponseBody
	public List<LJJPerformanceVo> selectPerformance(String tackId){
		List<LJJPerformanceVo> selectPerformance = examPaperService.selectPerformance(tackId);
		if(selectPerformance!=null) {
			return selectPerformance;
		}
		return null;
	}
	

	
	/**
	 * 试卷列表
	 * @param pageNum
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/examPaper/examPaperList")
	public String examPaperList(@RequestParam(name = "page", defaultValue = "1") Integer pageNum,
								@RequestParam(name = "limit", defaultValue = "10") Integer pageSize,
								Model model) {
		model.addAttribute("examPaperList", examPaperService.selectExamPaperList(pageNum, pageSize));
		return "/WeAdmin/pages/test/list.jsp";
	}
	
	/**
	 * 进入添加试卷页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/examPaper/toAddExamPaperPage")
	public String toAddExamPaperPage(Model model) {
		model.addAttribute("categoryParentList",questionService.selectCategoryByParentId(QUESTION_CATEGORY_PARENT_ID));
		model.addAttribute("questionList", examPaperService.selectIdQuestionContent());
		return "/WeAdmin/pages/test/addExamPaperPage.jsp";
	}
	
	/**
	 * 添加试卷
	 * @param examPaper
	 * @param questionIdArr
	 * @return
	 */
	@RequestMapping("/examPaper/addExamPaper")
	@ResponseBody
	public ServerResponse addExamPaper(TExamPaper examPaper, Integer[] questionIdArr) {
		return examPaperService.addExamPaper(examPaper, questionIdArr);
	}
	
	/**
	 * 进入修改试卷页面
	 * @param examPaperId
	 * @param model
	 * @return
	 */
	@RequestMapping("/examPaper/toUpdateExamPaperPage")
	public String toUpdateExamPaperPage(Integer examPaperId, Model model) {
		model.addAttribute("categoryParentList",questionService.selectCategoryByParentId(QUESTION_CATEGORY_PARENT_ID));
		List<ExamPaperQuestionVo> list = examPaperService.selectExamPaperInfoById(examPaperId);
		model.addAttribute("examPaperInfoList", list);
		model.addAttribute("allSonCategory", questionService.selectAllSonCategory(list.get(0).getParentId()));
		return "/WeAdmin/pages/test/updateExamPaperPage.jsp";
	}
	
	/**
	 * 返回JSON测试
	 * @param pageNum
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsonTest")
	@ResponseBody
	public ServerResponse jsonTest(@RequestParam(value = "pageNum", defaultValue = "1")Integer pageNum, 
							       @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
							       Model model) {
		return ServerResponse.createBySuccess(questionService.selectAllSonCategory(4));
	}
	
	/**
	 * 获取参数测试
	 */
	@RequestMapping("/paramTest")
	@ResponseBody
	public ServerResponse getParamTest() {
		return ServerResponse.createBySuccess();
	}
}
