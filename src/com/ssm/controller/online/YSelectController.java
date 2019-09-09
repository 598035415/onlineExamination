package com.ssm.controller.online;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.common.CostomPage;
import com.ssm.common.GlobalSessionUser;
import com.ssm.dao.YOnLineExamMapper;
import com.ssm.pojo.TTestRecord;
import com.ssm.pojo.TUser;
import com.ssm.vo.YUserTaskVO;

/**
 * 查询Controller
 * @author YL
 */
@Controller
@RequestMapping("/person")
public class YSelectController {

	private static final String PRE_FIX = "/OnLine/leading-page/";
	
	@Autowired
	private YOnLineExamMapper yoem;
	
	/**
	 * 个人中心的考试记录。进入页面，并查询记录。
	 */
	@RequestMapping("/exam/rows")
	public String innerExamRowsPage(HttpSession session,Model m,@RequestParam(defaultValue = "1")String currentPage) {
		// 查询这个用户下的所有考试记录，并分页。
		TUser  tUser =(TUser)session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(tUser == null) {
			// 重定向到主页
			return "redirect:/online/home";
		}
		// 根据用户id查找所有考试记录VO
		int parseInt = 1;
		try {
			parseInt= Integer.parseInt(currentPage);	
		} catch (Exception e) {
			parseInt = 1;
		}
		PageHelper.startPage(parseInt, 5);
		
		PageInfo<YUserTaskVO> pageInfo = new PageInfo<YUserTaskVO>(this.yoem.selectStudentTask(tUser.getId())); 
		
		CostomPage<YUserTaskVO> page = new CostomPage<YUserTaskVO>();
		page.setCurrentPage(parseInt);
		page.setTotalCount(pageInfo.getTotal());
		page.setResultList(pageInfo.getList());
		m.addAttribute("page", page);
		return PRE_FIX + "my-homePage/myExam.jsp";
	}
	/**
	 * 个人中心，进入练习记录页面列表
	 */
	@RequestMapping("/exercise/rows")
	public String innerExerciseRowsPage(HttpSession session,Model m,@RequestParam(defaultValue = "1")String currentPage) {
		// 查询这个用户下的所有考试记录，并分页。
		TUser  tUser =(TUser)session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(tUser == null) {
			// 重定向到主页
			return "redirect:/online/home";
		}
		// 根据用户id查找所有练习记录VO
		int parseInt = 1;
		try {
			parseInt= Integer.parseInt(currentPage);	
		} catch (Exception e) {
			parseInt = 1;
		}
		PageHelper.startPage(parseInt, 5);
		PageInfo<TTestRecord> pageInfo = new PageInfo<TTestRecord>(this.yoem.selectStudentExerciseTask(tUser.getId())); 
		
		CostomPage<TTestRecord> page = new CostomPage<TTestRecord>();
		page.setCurrentPage(parseInt);
		page.setTotalCount(pageInfo.getTotal());
		page.setResultList(pageInfo.getList());
		
		m.addAttribute("page", page);
		return PRE_FIX + "my-homePage/myExercise.jsp";
	}
 }
