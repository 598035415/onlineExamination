package com.ssm.controller.online;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.CostomPage;
import com.ssm.service.YOnLineExamService;
import com.ssm.vo.YOnLineTaskListVO;

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
	
	private static final String onlinePre = "/OnLine/leading-page/";
	
	/**
	 * 前台考试任务列表,转发请求.
	 * @return
	 */
	@RequestMapping("/task/list")
	public String onLineTaskList(
			@RequestParam(defaultValue = "1") Integer currentPage,Model m) {
		m.addAttribute("page", this.yOnLineExamService.onLineTaskList(currentPage));
		return onlinePre + "contest/index.jsp";
		// Page{pageNum=1, pageSize=1, startRow=0, endRow=1, total=0, pages=0, reasonable=false, pageSizeZero=false}
	}
	
}
