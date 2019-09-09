package com.ssm.controller.online;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.ssm.common.ExamRowsQuestionAnser;
import com.ssm.common.GlobalSessionUser;
import com.ssm.common.LayUITreeUl;
import com.ssm.common.ServerResponse;
import com.ssm.dao.YSimulationExerciseMapper;
import com.ssm.pojo.TUser;
import com.ssm.service.YSimulationExerciseService;
import com.ssm.vo.YExamQuestionVO;

/**
 *  模拟练习Controller
 * @Date 2019年9月8日
 * @Author YL
 */
@Controller
@RequestMapping("/simu")
public class YSimulationExerciseController {
	
	@Autowired
	private YSimulationExerciseService yses;
	
	@Autowired
	private YSimulationExerciseMapper ysem;
	
	private String PRE_FIX= "/OnLine/leading-page/";
	
	/**
	 * 进入模拟练习页面选择界面。
	 */
	@RequestMapping("/simex/select")
	public String innerSimExSelect(HttpSession session) {
		// 如果session为空，则不给进入。
		TUser currentAccount = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(currentAccount==null) {
			return "redirect:/online/task/list";
		}
		return PRE_FIX + "/sim/test_select.jsp";
	}
	
	/**
	 * 渲染题目类型树
	 */
	@RequestMapping("/simex/select/type")
	public @ResponseBody List<LayUITreeUl> renderQuestionTypeTree(HttpSession session) {
		// 如果session为空，则不给进入
		TUser currentAccount = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(currentAccount==null) {
			return new ArrayList<LayUITreeUl>();
		}
		// 返回一个json数组的layui结构
		List<LayUITreeUl> renderQuestionTypeTree = yses.renderQuestionTypeTree();
		// 响应出去
		return renderQuestionTypeTree;
	}
	
	/**
	 *    进入模拟练习界面,携带参数  题目类型，数量到js中
	 */
	
	@RequestMapping("/inner/test/page")
	public String innerTestPage(String checkeds,String count,Model m,HttpSession session) {
		// 如果session为空，则不给进入
		TUser currentAccount = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(currentAccount==null) {
			return "redirect:/online/task/list";
		}
		m.addAttribute("checkeds" , checkeds);
		m.addAttribute("count" , count);
		
		
		return PRE_FIX +"/sim/detail.jsp";
	}
	
	/**
	   *   渲染模拟测试题目,随机生成题目。
	 * List<YExamQuestionVO>
	 */
	
	@RequestMapping("/test/render/question")
	public @ResponseBody List<YExamQuestionVO> renderTestQuestion(String checkeds,String count,HttpSession session) {
		
		// 如果session为空，则不给进入
		TUser currentAccount = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(currentAccount==null) {
			return new ArrayList<YExamQuestionVO>();
		}
		// 将选中的题目类目id和数量，传递给service
		return this.yses.renderTestQuestion(checkeds, count);
	}
	
	
	/**
	 * 处理交卷请求，并生成考试记录,算出 正确率。
	 */
	@RequestMapping(value = "/submitTestPage",method = RequestMethod.POST)
	public @ResponseBody ServerResponse<String> submitPage(Integer questionSize,String testName,String totalTime,String jsonStr,HttpSession session) {
		// 获取当前sessionid
		TUser currentAccount = (TUser) session.getAttribute(GlobalSessionUser.preCurrentUser.toString());
		if(currentAccount==null) {
			return ServerResponse.createByErrorMessage("未登录！");
		}
		// 用户提交的问题，和答案。用户id，用时，
		
		List<ExamRowsQuestionAnser> questionAnserList = JSONArray.parseArray(jsonStr,ExamRowsQuestionAnser.class);
		
		return this.yses.addPage(questionSize,testName,currentAccount.getId(), totalTime, questionAnserList);
		
	}
	
	
}
