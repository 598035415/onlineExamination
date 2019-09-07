package com.ssm.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.env.IModule.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.common.CostomPage;
import com.ssm.common.ExamRowsQuestionAnser;
import com.ssm.dao.YOnLineExamMapper;
import com.ssm.service.YOnLineExamService;
import com.ssm.vo.YExamQuestionAnswerVO;
import com.ssm.vo.YExamQuestionVO;
import com.ssm.vo.YOnLineTaskListVO;
import com.ssm.common.ServerResponse;
/**
 * 前端考试任务列表实现类
 * @Date 2019年9月6日
 * @Author YL
 */
@Service
public class YOnLineExamServiceImpl  implements YOnLineExamService{
	
	@Autowired
	private YOnLineExamMapper yOnLineExamMapper;
	
	/**
	 *   前端考试任务列表
	 */
	@Override
	public CostomPage<YOnLineTaskListVO> onLineTaskList(Integer currentPage) {
		CostomPage<YOnLineTaskListVO> costomPage = new CostomPage<YOnLineTaskListVO>();
		costomPage.setCurrentPage(currentPage);
		// 维护考场状态变更情况
		String currentTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		// 执行更新操作
		yOnLineExamMapper.updateExamPublishStatusBefore(currentTime);yOnLineExamMapper.updateExamPublishStatusBetweenAnd(currentTime);yOnLineExamMapper.updateExamPublishStatusAfter(currentTime);
		//  开启分页
		PageHelper.startPage(currentPage,costomPage.getPageSize());
		PageInfo<YOnLineTaskListVO> pageInfo = new PageInfo<YOnLineTaskListVO>(yOnLineExamMapper.selectOnLineTaskListAndExsting());
		costomPage.setCurrentPage(pageInfo.getPageNum());
		costomPage.setTotalCount(pageInfo.getTotal());
		costomPage.setResultList(pageInfo.getList());
		return costomPage;
			
	}
	
	/**
	 *  前端任务下的考场渲染，题目，信息。 
	 */
	@Override
	public Map<String, Object> examPageRender(Integer taskId) {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		// 1,根据任务id，学生id，查出考试信息，及学员信息。
		YOnLineTaskListVO selectOnLineExamRenderInfo = this.yOnLineExamMapper.selectOnLineExamRenderInfo(taskId);
		resultMap.put("examInfo",selectOnLineExamRenderInfo); // 还差一个用户名
		// 2，根据任务id，查出该卷子下的所有题目。考虑多选的情况，等等。
		List<YExamQuestionVO> examQuestionAll = yOnLineExamMapper.selectQuestionAllByTaskId(taskId);
		resultMap.put("questions", examQuestionAll);
		return resultMap;
	}
	
	/**
	 * 交卷操作：
	 * 	1，算出成绩，并生成一条考试记录。
	 *  2，并记录考生的答案，一对多。
	 *  3，跳转到考试记录页面
	 */
	
	@Override
	public ServerResponse<Integer> addPage(Integer userId, Integer taskId,
			List<ExamRowsQuestionAnser> questionAnserList) {
		// 1，计算分数方法
		int mark  = 0 ;
		try {
			mark = this.ceilScore(questionAnserList, taskId);
		} catch (Exception e) {
			mark = 0;
		}
		if(questionAnserList==null || questionAnserList.size()<=0) {
			mark = 0;
		}
		// 2，生成考试记录
		Integer insertTxamRecord = this.yOnLineExamMapper.insertTxamRecord(taskId,userId,mark,new Date());
		// 3，生成考试答案，一对多。
		this.yOnLineExamMapper.insertStudentExamAnswer(taskId, userId, questionAnserList);
		return insertTxamRecord.intValue()>0 ? ServerResponse.createBySuccess("交卷成功，您的成绩为 ： "+ mark+",是否查看详情？",userId) : ServerResponse.createBySuccessMessage("服务器出现异常！稍后试试！");
	}
	
	private int ceilScore(List<ExamRowsQuestionAnser> questionAnserList,Integer taskId) {
		// 定义一个统分的记录值
		int mark = 0 ;
		// 查找出该考场下所有题目，并携带正确答案的answer子栏目
				List<YExamQuestionVO> selectOnLineTaskQuestionAnswerTrue = this.yOnLineExamMapper.selectOnLineTaskQuestionAnswerTrue(taskId);
				for (YExamQuestionVO question : selectOnLineTaskQuestionAnswerTrue) {
					for(ExamRowsQuestionAnser userQuestionAnser : questionAnserList) {
						// 1,核对是否是这一道题目 
						if(question.getQuestionId().intValue() == userQuestionAnser.getQuestionId().intValue()) {
							// 2,校验类型，是单选，还是多选
							if(question.getQuestionTypeId().intValue() == 2) {
								// 走循环，执行多选。
								try {
									// 进行字符串拆分
									int isTrueCount = 0;
									String[] myAnserList= userQuestionAnser.getAnswerId().split(",");
									for(YExamQuestionAnswerVO questionAnser: question.getAnswerList()) {
										if(myAnserList!=null && myAnserList.length>0) {
											for(String answer : myAnserList) {
												if(questionAnser.getAnswerId().intValue() == Integer.parseInt(answer)) {
													isTrueCount++;
												}
											}
										}
									}
									if(myAnserList.length ==question.getAnswerList().size() && isTrueCount == question.getAnswerList().size()) {
										mark +=question.getQuestionScore();
									}
								} catch (Exception e) {System.out.println("------");}
							}else {
								// 3, 校验答案的正确率
								if(question.getAnswerList()!=null && userQuestionAnser.getAnswerId()!=null)  {
									if(question.getAnswerList().get(0).getAnswerId().intValue() ==  Integer.parseInt(userQuestionAnser.getAnswerId())) {
										mark += question.getQuestionScore();
										continue;
									}
								}
							}
						}
					}
				}
		return mark;
	}

}
