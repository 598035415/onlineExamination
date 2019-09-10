package com.ssm.controller.online;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.service.YTaskManagerService;
import com.ssm.util.LayUITableBean;
import com.ssm.vo.YTaskListVo;

/**
 * 考试发布任务CRUD
 * @author YL
 * @Date 2019/9/10 18:57
 *
 */
@Controller
@RequestMapping("/task/manager")
public class YTaskManagerController {
	
	@Autowired
	private YTaskManagerService taskManagerService;
	
	// 访问前缀
	private static final String PREFIX = "";
	
	/**
	 *  进入考试任务列表页面
	 */
	@RequestMapping("/page")
	public String innerTaskManagerPage() {
		return "";
	}
	
	/**
	 *  任务列表渲染数据表格。
	 */
	@RequestMapping("/list")
	@ResponseBody
	public LayUITableBean<YTaskListVo> taskMangerList(@RequestParam(defaultValue = "1")String page,@RequestParam(defaultValue = "5")String limit
			,String clazzId,String currentType) {
		Integer pageI = null;
		Integer limitI = null;
		Integer clazzIdI = null;
		Integer currentTypeI = null;
		try {pageI = Integer.parseInt(page);} catch (Exception e) {pageI = 1;}
		try {limitI = Integer.parseInt(limit);} catch (Exception e) {limitI = 5;}
		try {clazzIdI = Integer.parseInt(clazzId);} catch (Exception e) {clazzIdI = null;}
		try {currentTypeI = Integer.parseInt(currentType);} catch (Exception e) {currentTypeI = null;}
		return taskManagerService.renderTaskList(pageI, limitI, clazzIdI, currentTypeI);
	}
	
}
