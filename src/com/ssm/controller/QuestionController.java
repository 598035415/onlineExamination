package com.ssm.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.dao.LWQuestionMapper;
import com.ssm.pojo.TQuestion;
import com.ssm.pojo.TQuestionCategory;
import com.ssm.service.IQuestionService;
import com.ssm.util.ServerResponse;
import com.ssm.vo.ProblemDetailVO;
import com.ssm.vo.QuestionParticularsVo;

/**
 * 实体控制类
 * @author chenlei
 */
@Controller
@RequestMapping("/question")
public class QuestionController {
	
	//对应数据字典的type
	private static final Integer QUESTION_TYPE = 1;//选择题类型
	private static final Integer ANSWER_SELECT = 2;//ABCD
	private static final Integer ANSWER_TRUEORFALSE = 3;//判断题
	private static final Integer QUESTION_CATEGORY_PARENT_ID = 0;//选择题类目
	
	@Autowired
	private IQuestionService questionService;
	
	
	/**
	 * 跳转
	 */
	@RequestMapping("/{index}")
	public String questionIndex(@PathVariable String index) {
		return "WeAdmin/pages/question/"+index+".jsp";
	}
	
	/**
	 * 试题列表
	 * @param pageNum 当前页
	 * @param pageSize 页容量
	 * @param model
	 * @return
	 */
	@RequestMapping("/questionList")
	public String questionList(@RequestParam(value = "pageNum", defaultValue = "1")Integer pageNum, 
							   @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
							   Model model) {
		model.addAttribute("serverResponse", questionService.queryQuestionList(pageNum, pageSize));
		return "/WeAdmin/pages/question/list.jsp";
	}
	
	/**
	 * 进入添加试题页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/toAddQuestionPage")
	public String toAddQuestionPage(Model model) {
		model.addAttribute("typeList", questionService.queryDictByType(QUESTION_TYPE));
		model.addAttribute("categoryParentList",questionService.selectCategoryByParentId(QUESTION_CATEGORY_PARENT_ID));
		model.addAttribute("selectList", questionService.queryDictByType(ANSWER_SELECT));
		model.addAttribute("trueOrFalse", questionService.queryDictByType(ANSWER_TRUEORFALSE));
		return "/WeAdmin/pages/question/addQuestionPage.jsp";
	}
	
	/**
	 * 添加单选题
	 * @param question
	 * @param answerContents
	 * @param checked
	 * @param answerSelects
	 * @return
	 */
	@RequestMapping("/addQuestion")
	@ResponseBody
	public ServerResponse addQuestion(TQuestion question, String[] answerContents, Integer checked,String[] answerSelects) {
		return questionService.addQuestion(question, answerContents, checked, answerSelects);
	}
	
	/**
	 * 添加多选题
	 * @param question
	 * @param answerContents
	 * @param checked
	 * @param answerSelects
	 * @return
	 */
	@RequestMapping("/addMultiQuestion")
	@ResponseBody
	public ServerResponse addMultiQuestion(TQuestion question, String[] answerContents, 
											Integer[] checked, String[] answerSelects) {
		return questionService.addMultiQuestion(question, answerContents, checked, answerSelects);
	}
	/**
	 * 添加判断题
	 * @param question
	 * @param judgeOption
	 * @param answerCount
	 * @param dataIndex
	 * @return
	 */
	@RequestMapping("/addJudgeQuestion")
	@ResponseBody
	public ServerResponse addJudgeQuestion(TQuestion question, Integer judgeOption, Integer answerCount, Integer dataIndex) {
		return  questionService.addJudgeQuestion(question, judgeOption, answerCount, dataIndex);
	}
	/**
	 * 通过父ID获取试题数据
	 * @param parentId
	 * @return
	 */
	@RequestMapping("/getCategoryByParentId")
	@ResponseBody
	public ServerResponse getCategoryByParentId(Integer parentId) {
		return questionService.selectCategoryByParentId(parentId);
	}
	
	/**
	 * 删除所有选中的question节点
	 * @param questionIds
	 * @return
	 */
	@RequestMapping("/delCheckedQuestion")
	@ResponseBody
	public ServerResponse delCheckedQuestion(Integer[] questionIds) {
		return questionService.delCheckedQuestion(questionIds);
	}
	
	@RequestMapping("/toUpdateQuestionPage")
	public String toUpdateQuestionPage(Integer questionId, Model model) {
		/*用来做二级联动*/
		//获取所有一级类别的题目
		model.addAttribute("categoryParentList",questionService.selectCategoryByParentId(QUESTION_CATEGORY_PARENT_ID));
		//通过questionId查找到对应的二级类别
		TQuestionCategory category = questionService.selectCategoryByQuestionId(questionId);
		model.addAttribute("currentQuestionCategory", category);
		//获取所有与questionId相同父节点的子节点的数据
		model.addAttribute("allSonCategory", questionService.selectAllSonCategory(category.getParentId()));
		//所有的试题类别
		model.addAttribute("typeList", questionService.queryDictByType(QUESTION_TYPE));
		
		/*用来选定题型*/
		//通过questionId获取question
		TQuestion question = questionService.selectQuestionById(questionId);
		
		model.addAttribute("question", question);
		return "/WeAdmin/pages/question/updateQuestionPage.jsp";
	}
	
	/**
	 * 根据id获取question信息
	 */
	@RequestMapping("/toQuestionInfo")
	public String toQuestionInfo(String id,String lei,HttpServletRequest request) {
		QuestionParticularsVo selectDetails = questionService.selectDetails(id);
		selectDetails.setLei(lei);
		System.out.println( selectDetails  );
		
		request.setAttribute("qp", selectDetails);
		
		
		return "/WeAdmin/pages/question/questionDetails.jsp";
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
		return ServerResponse.createBySuccess(questionService.selectQuestionById(1));
	}
}
