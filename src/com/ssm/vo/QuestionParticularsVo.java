package com.ssm.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class QuestionParticularsVo {
	
	private String questionType; // 题目类型
	
	private String questionTitle; // 题目 标题 
	
	private String lei; // 题目 分类
	
	private String questionCorrect=""; //正确答案
	
	private String questionAnalysi="";//题目解析
	
	private List<ProblemDetailVO> data=new ArrayList<ProblemDetailVO>(); // 题目选项
	
	
	
	public void addCorrect(String str) {
		this.questionCorrect+="，"+str;
	}
	
	public void addAnalysi(String str) {
		this.questionAnalysi+="<br/>"+str;
	}
	
}