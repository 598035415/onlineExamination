package com.ssm.util;

import lombok.Data;

@Data
public class ResponseEntity <T> {
	private String code="0";
	
	private String msg;
	
	private Long count;
	
	private T data;
	
}