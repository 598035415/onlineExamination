package com.ssm.controller.online;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.ssm.common.ExamRowsQuestionAnser;
import com.ssm.common.GlobalSessionUser;
import com.ssm.common.ServerResponse;
import com.ssm.dao.YOnLineExamMapper;
import com.ssm.pojo.TExamPublish;
import com.ssm.pojo.TExamRecord;
import com.ssm.pojo.TStudentExamAnswer;
import com.ssm.pojo.TUser;
import com.ssm.service.YOnLineExamService;
import com.ssm.vo.YExamQuestionTrueSelectVO;
import com.ssm.vo.YExamQuestionVO;

/**
 *  前台在线考试Controller
 * @Date 2019年9月6日
 * @Author YL
 */
@Controller 
@RequestMapping("/online")
public class YOnLineExamController {
	
	@Autowired
	private YOnLineExamMapper yolm;
	
	@Autowired
	private YOnLineExamService yOnLineExamService; 
	
	private static final String ONLINE_PRE = "/OnLine/leading-page/";
	
	/**
	 * 前台考试任务列表,转发请求.
	 * @return
	 */
	@RequestMapping("/task/list")
	public String onLineTaskList(
			@RequestParam(defaultValue = "1") String currentPageStr,Model m) {
		Integer currentPage = null;
		try {currentPage = Integer.parseInt(currentPageStr);} catch (Exception e) {currentPage = 1;}
		m.addAttribute("page", this.yOnLineExamService.onLineTaskList(currentPage));
		return ONLINE_PRE + "contest/index.jsp";
	}
	/**
	 *   校验进入考试界面，返回json
	 */
	@RequestMapping("/exam/{taskId}")
	public @ResponseBody ServerResponse<Integer>  checkOnLineExamPage(@PathVariable(value = "taskId")String taskIdStr
									   ,HttpSession session) {
		Integer taskId = null;
		// 防止非法RESTful参数。
		try {taskId = Integer.parseInt(taskIdStr);} catch (Exception e) {return ServerResponse.createByErrorMessage("非法参数！");}
		// 1,校验session是否可以用，
		TUser tUser = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(tUser == null) {
			return ServerResponse.createByErrorMessage("未登录");
		}
		// 2，校验学生的所属班级是否是这个班
		TExamPublish selectExamTaskById = yolm.selectExamTaskById(taskId);
		if(selectExamTaskById==null ) {
			return ServerResponse.createByErrorMessage("非法参数！");
		}
		if(tUser.getClazzId()==null) {
			return ServerResponse.createByErrorMessage("你不是该班级学生哦！");
		}
		if(tUser.getClazzId()!=null) {
			if(selectExamTaskById.getClazzId().intValue() != tUser.getClazzId().intValue()) {
				return ServerResponse.createByErrorMessage("你不是该班学生哦！");
			}
		}
		// 3，校验考场是否可以用，为进行，已结束等
		if(selectExamTaskById.getCurrentType().intValue()==1) {
			return ServerResponse.createByErrorMessage("抱歉，未进行！");
		}else if (selectExamTaskById.getCurrentType().intValue()==3) {
			return ServerResponse.createByErrorMessage("抱歉，已经结束了哦！");
		}
		// 根据当前用户id，查找考试记录。
		TExamRecord selectStudentRecord = this.yolm.selectStudentRecord(tUser.getId(), taskId);
		if(selectStudentRecord!=null) {
			// 4，已经提交的卷子，不能再次提交。
			return ServerResponse.createByErrorMessage("已经交卷的任务，不能再次考试哦！");
		}
		//ONLINE_PRE + "contest/detail.jsp"
		return ServerResponse.createBySuccess("访问成功", taskId);
	}
	/**
	 *   进入考试界面. ，转发请求
	 */
	@RequestMapping("/exams/{taskId}")
	public String innerOnLineExamPage(@PathVariable(value = "taskId")String taskIdStr
			   ,HttpSession session,Model m) {
		Integer taskId = null;
		// 防止非法RESTful参数。
		try {taskId = Integer.parseInt(taskIdStr);} catch (Exception e) {return ONLINE_PRE + "online/task/list";}
		// 1,校验session是否可以用，
		TUser tUser = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(tUser == null) {
			return ONLINE_PRE + "contest/detail.jsp";
		}
		// 2，校验学生的所属班级是否是这个班
		TExamPublish selectExamTaskById = yolm.selectExamTaskById(taskId);
		if(selectExamTaskById==null ) {
			return ONLINE_PRE + "contest/detail.jsp";
		}
		if(tUser.getClazzId()==null) {
			return ONLINE_PRE + "contest/detail.jsp";
		}
		if(tUser.getClazzId()!=null) {
			if(selectExamTaskById.getClazzId().intValue() != tUser.getClazzId().intValue()) {
				return ONLINE_PRE + "contest/detail.jsp";
			}
		}
		// 3，校验考场是否可以用，为进行，已结束等
		if(selectExamTaskById.getCurrentType().intValue()==1) {
			return ONLINE_PRE + "contest/detail.jsp";
		}else if (selectExamTaskById.getCurrentType().intValue()==3) {
			return ONLINE_PRE + "contest/detail.jsp";
		}
		// 根据当前用户id，查找考试记录。
		TExamRecord selectStudentRecord = this.yolm.selectStudentRecord(tUser.getId(), taskId);
		if(selectStudentRecord!=null) {
			// 4，已经提交的卷子，不能再次提交。
			return ONLINE_PRE + "contest/detail.jsp";
		}
		//ONLINE_PRE + "contest/detail.jsp"
		m.addAttribute("examInfo",this.yOnLineExamService.examPageRender(taskId).get("examInfo"));
		m.addAttribute("taskId",taskId);
		return ONLINE_PRE + "contest/detail.jsp";
	}
	
	/**
	 *  进入考场，渲染题目
	 *  @param task_id
	 */
	@RequestMapping("/exam/render/{taskId}")
	public @ResponseBody List<YExamQuestionVO> examPageRender(@PathVariable(value = "taskId")String taskIdStr,HttpSession session){
		//taskId 
		Integer taskId = null;
		// 防止非法RESTful参数。
		try {taskId = Integer.parseInt(taskIdStr);} catch (Exception e) { return new ArrayList<YExamQuestionVO>();}
		// 1,校验session是否可以用，
		TUser tUser = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(tUser == null) {
			return new ArrayList<YExamQuestionVO>();
		}
		// 2，校验学生的所属班级是否是这个班
		TExamPublish selectExamTaskById = yolm.selectExamTaskById(taskId);
		if(selectExamTaskById==null ) {
			return new ArrayList<YExamQuestionVO>();
		}
		if(selectExamTaskById.getClazzId().intValue() != tUser.getClazzId().intValue()) {
			return new ArrayList<YExamQuestionVO>();
		}
		// 3，校验考场是否可以用，为进行，已结束等
		if(selectExamTaskById.getCurrentType().intValue()==1) {
			return new ArrayList<YExamQuestionVO>();
		}else if (selectExamTaskById.getCurrentType().intValue()==3) {
			return new ArrayList<YExamQuestionVO>();
		}
		// 根据当前用户id，查找考试记录。
		TExamRecord selectStudentRecord = this.yolm.selectStudentRecord(tUser.getId(), taskId);
		if(selectStudentRecord!=null) {
			// 4，已经提交的卷子，不能再次提交。
			return new ArrayList<YExamQuestionVO>();
		}
		
		// 传递session的当前用户id
		Map<String, Object> examPageRender = this.yOnLineExamService.examPageRender(taskId);
		List<YExamQuestionVO> questions = (List<YExamQuestionVO>) examPageRender.get("questions");
		return questions == null ? new ArrayList<YExamQuestionVO>() : questions ;
	
	}
	
	/**
	 * 处理交卷请求，并生成考试记录,算出成绩。
	 */
	@RequestMapping(value = "/submitPage",method = RequestMethod.POST)
	public @ResponseBody ServerResponse submitPage(Integer taskId,String jsonStr,HttpSession session) {
		// 获取当前sessionid
		TUser currentAccount = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(currentAccount==null) {
			return ServerResponse.createByErrorMessage("未登录！");
		}
		// 2，校验学生的所属班级是否是这个班
		TExamPublish selectExamTaskById = yolm.selectExamTaskById(taskId);
		if(selectExamTaskById==null ) {
			return ServerResponse.createByErrorMessage("非法参数！");
		}
		if(selectExamTaskById.getClazzId().intValue() != currentAccount.getClazzId().intValue()) {
			return ServerResponse.createByErrorMessage("你不是该班学生哦！");
		}
		// 3，校验考场是否可以用，为进行，已结束等
		if(selectExamTaskById.getCurrentType().intValue()==1) {
			return ServerResponse.createByErrorMessage("抱歉，未进行！");
		}else if (selectExamTaskById.getCurrentType().intValue()==3) {
			return ServerResponse.createByErrorMessage("抱歉，已经结束了哦！");
		}
		// 根据当前用户id，查找考试记录。
		TExamRecord selectStudentRecord = this.yolm.selectStudentRecord(currentAccount.getId(), taskId);
		if(selectStudentRecord!=null) {
			// 4，已经提交的卷子，不能再次提交。
			return ServerResponse.createByErrorMessage("已经交卷的任务，不能再次考试哦！");
		}
		// 传递用户id，考试任务id，用户提交的问题，和答案。
		List<ExamRowsQuestionAnser> questionAnserList = JSONArray.parseArray(jsonStr,ExamRowsQuestionAnser.class);
		return this.yOnLineExamService.addPage(currentAccount.getId(), taskId, questionAnserList);
	}
	
	/**
	 * 进入考试 成绩详情
	 */
	@RequestMapping("/inner/exam/info")
	public String innerExamInfo(Integer userId,Integer taskId,Model m,HttpSession session) {
		// 	1,校验session是否可以用，
		TUser tUser = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(tUser == null) {
			return "redirect:/online/task/list";
		}
		m.addAttribute("userId",userId);
		m.addAttribute("taskId", taskId);
		return ONLINE_PRE + "contest/exam_info.jsp";
	}
	
	/**
	 * 考生的个人考试详情，参数： taskId,userId
	 * 1,查找任务下的该场考试，并找出所有题目，默认白色，
	 * 2，查找用户下的所有
	 */
	@RequestMapping("/person/exam/info")
	public @ResponseBody Map<String,Object> getPersonExamInfo(Integer userId,Integer taskId,HttpSession session) {
		// 1,校验session是否可以用，
		TUser tUser = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(tUser == null) {
			return new HashMap<String, Object>();
		}
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		// 该场任务下所有题目，包括答案
		List<YExamQuestionVO> taskQuestionAllList = this.yolm.selectQuestionAllByTaskId(taskId);
		// 该用户下的所有该场任务想，回答的题目。
		resultMap.put("alluestion", taskQuestionAllList);
		List<TStudentExamAnswer> selectStudentTaskAnswer = this.yolm.selectStudentTaskAnswer(userId, taskId);
		resultMap.put("personQuestion", selectStudentTaskAnswer);
		
		// 这里开始。  返回questionId 和 我的答案，字符串，的格式。
		try {
			// 每循环一个问题，都会有一个答案。
			for (TStudentExamAnswer tStudentExamAnswer : selectStudentTaskAnswer) {
				// 通过答案id，查找答案。
				String[] arrTemp  = tStudentExamAnswer.getMyAnswer().split(",");
				if(arrTemp!=null ) {
					// 传递到Mapper中处理。
					List<YExamQuestionTrueSelectVO> selectStudentExamAnswer = this.yolm.selectStudentExamAnswer(arrTemp);
					// 传递到当前这个题目中
					tStudentExamAnswer.setAnswerList(selectStudentExamAnswer);
				}
			}
		} catch (Exception e) {
			System.out.println("test");
		}
		return resultMap;
	}
}

