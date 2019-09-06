package com.ssm.handler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.common.ServerResponse;
import com.ssm.exception.YLCustomBusinessException;

/**
 * 全局异常处理器
 * @Date 2019年9月6日
 * @Author YL
 */
@ControllerAdvice
public class GlobalExceptionHandler {
	
	/**
	 * YL业务异常处理方法
	 */
	@SuppressWarnings("rawtypes")
	@ExceptionHandler(YLCustomBusinessException.class)
	public @ResponseBody ServerResponse ylBusinessHandler(YLCustomBusinessException e) {
		return ServerResponse.createByErrorMessage(e.getMessage());
	}
	
}
