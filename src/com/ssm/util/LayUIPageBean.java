package com.ssm.util;

import lombok.Data;
import lombok.ToString;


@Data
@ToString
public class LayUIPageBean{
	private int code;

	private String msg;

	private int count;

	private Object data;
}
