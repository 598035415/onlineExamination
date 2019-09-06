package com.ssm.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 前端考试任务列表
 * @Date 2019年9月6日
 * @Author YL
 */
@Data
public class YOnLineTaskListVO  implements Serializable{

	private static final long serialVersionUID = 8142226403243652897L;
	
	private Integer id ;
	private Integer examId ;
	private Date startTime;
	private Date endTime;
	private Integer clazzId;
	private Byte status;
	private Integer publishPerson;
	private String clazzName;
	private String examPaperTitle;
	private Integer examPaperTotalScroe;
	private String username;
	private Integer currentType;
	
	

}
