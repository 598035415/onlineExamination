package com.ssm.util;

import lombok.Data;

@Data
public class Page {
	private Integer page;
	private Integer limit;
	
	// 数据字典
	private String type;   //类型
	private String label;  //标签名
	
	//日志
	private String loginName;  // 姓名
	private String ip;
	private String startTime;  //开始时间
	private String endTime;	   //结束时间
	
}
