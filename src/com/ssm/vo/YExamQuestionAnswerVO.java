package com.ssm.vo;

import java.io.Serializable;

import lombok.Data;

/**
 * 一个题目下的所有答案
 * @Date 2019年9月6日
 * @Author YL
 */
@Data
public class YExamQuestionAnswerVO implements Serializable{

	private static final long serialVersionUID = 2995862755510999562L;
	
	private Integer answerId=-1;
	private Integer isAnswerTrue;
	
	private String answerContent;
	private String answerSelect;
	

}
