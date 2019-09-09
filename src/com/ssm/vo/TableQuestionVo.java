package com.ssm.vo;


import lombok.Data;

@Data
public class TableQuestionVo {
	private Integer id;

    private String questionType;
    
    private String questionCategory;

    private String questionContent;

    private Integer status;


}
