package com.ssm.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.common.ExamRowsQuestionAnser;
import com.ssm.common.LayUITreeUl;
import com.ssm.common.ServerResponse;
import com.ssm.dao.YSimulationExerciseMapper;
import com.ssm.pojo.TTestRecord;
import com.ssm.service.YSimulationExerciseService;
import com.ssm.vo.YExamQuestionAnswerVO;
import com.ssm.vo.YExamQuestionVO;
/** 
 * 前端模拟测试实现类
 * @Date 2019年9月8日
 * @Author YL
 */
@Service
public class YSimulationExerciseServiceImpl implements YSimulationExerciseService {
	
	@Autowired
	private YSimulationExerciseMapper ysem;
	
	/**
	 *  渲染问题类目树 
	 */
	@Override
	public List<LayUITreeUl> renderQuestionTypeTree() {
		//  1, 先查询根节点数据
		List<LayUITreeUl> rootList = ysem.selectQuestionTypeByParentId(0);
		for(Iterator<LayUITreeUl> it = rootList.iterator() ; it.hasNext() ;) {
			LayUITreeUl next = it.next();
			deep(next);
		}
		return rootList;
	}
	
	//递归的方法，遍历子元素
	private void deep(LayUITreeUl node) {
		// 当前id作为父id查找子元素
		List<LayUITreeUl> childList = ysem.selectQuestionTypeByParentId(node.getId());
		node.setChildren(childList);
		// 循环当前父节点的子元素，递归一直调用。
		for( Iterator<LayUITreeUl> it = childList.iterator() ; it.hasNext() ;  ) {
			LayUITreeUl next = it.next();
			deep(next);
		}
	}
	
	/**
	 *    渲染test试卷的所有题目，根据选择的类目和数量 ,随机生成的题目。
	 */
	@Override
	public List<YExamQuestionVO> renderTestQuestion(String checkeds, String count) {
		// 1，校验格式
		if(checkeds==null) {
			return new ArrayList<YExamQuestionVO>(); 
		}
		if(count==null || "".equals(count)) {
			return new ArrayList<YExamQuestionVO>();
		}
		if(checkeds.length()>1) {
			if(!checkeds.contains(",")) {
				return new ArrayList<YExamQuestionVO>(); 
			}
		}
		// 执行sql，随机生成题目
		Integer countInt = null;
		try {
			countInt = Integer.parseInt(count);
		} catch (Exception e) {
			countInt = 5;
		}
		String[]  checkedArr= null;
		try {
			checkedArr = checkeds.split(",");
		} catch (Exception e) {
			return new ArrayList<YExamQuestionVO>();
		}
		
		return this.ysem.selectQuestionAllByTypeAndCount(checkedArr, countInt);
	}

	
	/**
	 * 交卷操作：
	 * 	1，算出成绩，并生成一条测试记录。
	 *  2，并记录考生的答案，一对多。
	 *  3，跳转到考试记录页面
	 */
	
	@Override
	public ServerResponse<String> addPage(Integer questionSize,String testName,Integer userId, String totalTime,
			List<ExamRowsQuestionAnser> testAnswerList) {
		
		String trueLv = ceilScore(testAnswerList,questionSize); //返回正确率
		// 通过testName生成试卷名称。
		String[] testNameArr = null;
		try {
			testNameArr = testName.split(",");
			List<String> selectQuestionTypeName = this.ysem.selectQuestionTypeName(testNameArr);
			testName="";
			for (int i = 0 ; i<selectQuestionTypeName.size();i++) {
				if(i==selectQuestionTypeName.size()-1) {
					testName+=selectQuestionTypeName.get(i);
					continue;
				}
				testName+=selectQuestionTypeName.get(i)+",";
			}
		} catch (Exception e) {
			testName=questionSize+"-"+userId;
		}
		
		// 1，生成test记录
		TTestRecord tTestRecord = new TTestRecord();
		tTestRecord.setTestName(testName);
		tTestRecord.setStudentId(userId);
		tTestRecord.setTotalTime(totalTime);
		tTestRecord.setAccuracy(trueLv);
		Integer insertStudentTestRecord = this.ysem.insertStudentTestRecord(tTestRecord);
		// 2，生成test的记录答案数。
		if(tTestRecord.getId()!=null) {
			if(testAnswerList!=null) {
				for (ExamRowsQuestionAnser temp:  testAnswerList) {
					temp.setTestExamId(tTestRecord.getId());
				}
				this.ysem.insertStudentTestQuestion(testAnswerList);
			}
		}
		
		return insertStudentTestRecord>0 ? ServerResponse.createBySuccess("交卷成功，正确率为  ："+ trueLv  +"。", userId+","+tTestRecord.getId()) : ServerResponse.createByErrorMessage("提交失败，请稍后试试！");
	}
	
	private String ceilScore(List<ExamRowsQuestionAnser> questionAnserList,Integer questionSize) {
		// 定义一个统分的记录值
		int mark = 0 ;  // 问题的长度: questionAnserList，正确的个数:mark，与问题的长度算出正确率
		// 分为多选和单选的情况。
		// 寻找正确率
		// 找出所有问题的正确答案。
		List<YExamQuestionVO> selectQuestionAndAnswerList = this.ysem.selectQuestionAndAnswerList();
		//循环所有的题目，如果和传递进来的题目id一样，证明答的是同一个题目。
		// 如果是同一个题目，比对答案
		try {
			for (YExamQuestionVO question : selectQuestionAndAnswerList) {
				for(ExamRowsQuestionAnser myQuestionAnswer: questionAnserList) {
					// 如果是相同的题目
					if(question.getQuestionId().intValue() == myQuestionAnswer.getQuestionId().intValue()) {
						// 去循环所有的答案,如果答案id对应上来。
						
						boolean flag = false;
						
						int tempCount = 0;
						//多选。
						if(question.getQuestionTypeId().intValue() == 2) {
							List<YExamQuestionAnswerVO> answerList = question.getAnswerList();
							for(YExamQuestionAnswerVO answer: answerList) {
								try {
									String[] split = myQuestionAnswer.getAnswerId().split(",");
									for (String s : split) {
										try {
											if(Integer.parseInt(s) == answer.getAnswerId().intValue()) {
												tempCount++;
											}
										} catch (Exception e) {
											System.out.println("非法字符数字");
										}
									}
								} catch (Exception e) {
									flag = false;// 出现异常，答案错误。非法的答案id	
								}
							}
							
							// 如果记录用户的count和正确答案的count一致。证明多选正确
							if(tempCount == question.getAnswerList().size()) {
								flag = true;
							}
							// if 标志位true，证明当前题目mark率加1
							if(flag) {
								mark++;
							}
						}
						//单选
						else {
							YExamQuestionAnswerVO yExamQuestionAnswerVO = question.getAnswerList().get(0);
							if(Integer.parseInt(myQuestionAnswer.getAnswerId()) == yExamQuestionAnswerVO.getAnswerId()) {
								// 答案相同，正确率加一。
								mark++;
							}
						}
						
						
					}
				}
			}
		} catch (Exception e) {
			System.out.println("testEx");
		}
		
		// 算法为： mark / size * 100%(100)  如：  24 / 40 *100 =60%
		double result= (double)mark/questionSize;
		double lv = (double)( result * 100);
		
		return questionSize>0 ? (int)lv +"% " : 0+"%";
	}
	
	

}
