package com.ssm.controller.online;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.service.YOnLineExamService;
import com.ssm.util.ServerResponse;

/**
 *  前台在线考试Controller
 * @Date 2019年9月6日
 * @Author YL
 */
@Controller 
@RequestMapping("/online")
public class YOnLineExamController {
	
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
	 *   进入考试界面. ，转发请求
	 */
	@RequestMapping("/exam/{taskId}")
	public String innserOnLineExamPage(@PathVariable(value = "taskId")String taskIdStr
									   ,Model m,HttpSession session) {
		Integer taskId = null;
		// 防止非法RESTful参数。
		try {taskId = Integer.parseInt(taskIdStr);} catch (Exception e) {return "/online/task/list";}
		
		// 如果session为null，不转发到考试界面
		
		m.addAttribute("examId", taskId);
		
		return ONLINE_PRE + "contest/detail.jsp";
	}
	
	/**
	   *      进入考场，渲染题目
	 *  @param task_id
	 */
	@RequestMapping("/exam/render/{taskId}")
	public @ResponseBody Map<String,Object> examPageRender(@PathVariable(value = "taskId")String taskIdStr){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Integer taskId = null;
		// 防止非法RESTful参数。
		try {taskId = Integer.parseInt(taskIdStr);} catch (Exception e) {resultMap.put("result", ServerResponse.createByErrorMessage("非法参数，考场渲染失败！")); return resultMap;}
		
		// 传递session的当前用户id
		
		
		return resultMap;
	
	}
	
	
	
	
}
