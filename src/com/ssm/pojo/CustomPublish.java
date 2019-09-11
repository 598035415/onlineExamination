package com.ssm.pojo;

import java.io.Serializable;


import lombok.Data;

@Data
public class CustomPublish implements Serializable {
	private static final long serialVersionUID = 8483043691633255939L;
	
	private Integer clazzId;
	private Integer examId;
	private String startTime;
	private String endTime;
	private Integer currentType;
	
	
}
