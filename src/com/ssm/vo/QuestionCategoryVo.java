package com.ssm.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionCategoryVo {
	private Integer id;
	private String categoryName; // 名称
	private Integer parentId;	//父ID
	
	private String categoryPicture; //图片
	
	private Integer status;		// 状态
	
	private String createPerson; //创建人
	
	
	
	private Date createTime; // 创建时间
	private Date updateTime; //修改时间
	
	private String createTimeS;	// 创建时间 String 化
	private String updateTimeS; // 修改时间  String 化
	
}
