package com.ssm.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ExamPaperVo {
	private Integer id;
	private String examPaperTitle;
	private Integer examPaperTotalScroe;
	private String examPaperType;
	private Integer qualifiedPoints;
	private Integer status;
	private Date createTime;
	private Date updateTime;
}
