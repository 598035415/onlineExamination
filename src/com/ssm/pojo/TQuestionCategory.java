package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TQuestionCategory {
	private Integer id;
	private String categoryName;
	private Integer parentId;
	private Integer status;
	private Date createTime;
	private Date updateTime;
	private String categoryPicture;
	private String createPerson;

}
