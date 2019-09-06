package com.ssm.vo;

import com.ssm.pojo.TQuestion;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class QuestionVo extends TQuestion{
	private String type;
	private String category;
}
