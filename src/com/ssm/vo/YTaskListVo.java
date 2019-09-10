package com.ssm.vo;

import java.io.Serializable;

import lombok.Data;

/**
 * 后台任务列表VO
 * @author YL 
 *
 */
@Data
public class YTaskListVo implements Serializable{
	
	private static final long serialVersionUID = 6921997050049399261L;
	
	private Integer id;
	private String clazzName;
	private Integer clazzId;
	private String startTime;
	private String endTime;
	private Integer currentType ;
	private Integer status;
	private String examPaperTitle;
	

}
