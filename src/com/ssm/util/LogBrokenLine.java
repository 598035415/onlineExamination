package com.ssm.util;

import lombok.Data;

@Data
public class LogBrokenLine {
	
	private String date;
	
	private Integer count=0;

	public LogBrokenLine(String date, Integer count) {
		this.date = date;
		this.count = count;
	}
	
	
}
