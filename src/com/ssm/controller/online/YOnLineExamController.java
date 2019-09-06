package com.ssm.controller.online;

import org.apache.ibatis.logging.log4j2.Log4j2AbstractLoggerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	/**
	 * 前台考试任务列表
	 * @return
	 */
	@RequestMapping("/task/list")
	public @ResponseBody CostomPage<YOnLineTaskListVO> onLineTaskList(
			@RequestParam(defaultValue = "1") Integer currentPage) {
		
		return this.yOnLineExamService.onLineTaskList(currentPage);
		// Page{pageNum=1, pageSize=1, startRow=0, endRow=1, total=0, pages=0, reasonable=false, pageSizeZero=false}
	}
	
}
