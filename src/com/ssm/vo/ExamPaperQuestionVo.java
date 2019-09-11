package com.ssm.vo;

import com.ssm.pojo.TExamPaper;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ExamPaperQuestionVo extends TExamPaper {
	private Integer questionId;
	private String questionContent;
	private Integer parentId;
}
