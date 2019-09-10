package com.ssm.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

/**
 * 某个考试任务下的考试的所有题目，包括类型
 * @Date 2019年9月6日
 * @Author YL
 */
@Data
public class YExamQuestionVO implements Serializable{

	private static final long serialVersionUID = -5177461916394799730L;
	
	
	private Integer taskId;
	private Integer examId;
	private Integer questionId;
	
	private String questionContent;
	private Integer questionScore;
	private String questionType;
	private Integer questionTypeId;
	private String myAnswer;
	
	private List<YExamQuestionAnswerVO> answerList; // 放一组的原因，避免多选的问题。不然就用一个实体类的List的

}
