package com.ssm.pojo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class TAnswer implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;

    private Integer questionId;

    private String answerContent;

    private Integer isAnswerTrue;

    private String answerSelect;

    private String answerTrueParse;

    private Date createTime;

    private Date updateTime;
}