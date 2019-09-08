package com.ssm.vo;

import java.io.Serializable;

import lombok.Data;

/**
 * 某个用户正确答案的选项
 * @author YL
 *
 */
@Data
public class YExamQuestionTrueSelectVO implements Serializable{

	private static final long serialVersionUID = -6617525846718341869L;
	
	private Integer question_id;
	private String answer_select;
	

}
