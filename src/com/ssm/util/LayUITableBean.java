package com.ssm.util;

import java.io.Serializable;
import java.util.List;

/**
 * Layui映射json数据表格实体
 * @author YL
 * @date 2019年7月9日
 */
public class LayUITableBean<T> implements Serializable {

	private Integer code = 0;
	private String msg = "";
	private Long count;
	private List<T> data;

	@Override
	public String toString() {
		return "LayUITableBean [code=" + code + ", msg=" + msg + ", count=" + count + ", data=" + data + "]";
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 891092845571644042L;

}
