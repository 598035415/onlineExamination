package com.ssm.exception;
/**
 * YLDIy业务异常类
 * @Date 2019年9月6日
 * @Author YL
 */
public class YLCustomBusinessException  extends RuntimeException{

	private static final long serialVersionUID = -7713722936181252975L;

	public YLCustomBusinessException() {
	}

	public YLCustomBusinessException(String message) {
		super(message);
	}
	
	
	
}
