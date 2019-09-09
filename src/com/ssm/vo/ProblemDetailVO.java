package com.ssm.vo;



import lombok.Data;

@Data
public class ProblemDetailVO {
	
	private String questionContent;//题目内容
	private String answerContent;//答案
	private String answerSelect;//题目选择
	private String label;//题目类型
	private String answerTrueParse;//题目解析
	private String isAnswerTrue;//正确答案
}
