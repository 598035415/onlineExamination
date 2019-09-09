package com.ssm.util;

import java.io.Serializable;

import lombok.Data;

@Data
public class ResponseEntity <T> implements Serializable{
	private static final long serialVersionUID = 1L;

	private String code="0";
	
	private String msg;
	
	private Long count;
	
	private T data;
	
}