package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TMenu {
	
	
	
    public TMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TMenu(String menuName, Integer parentId, String createTimes, Integer status) {
		super();
		this.menuName = menuName;
		this.parentId = parentId;
		this.createTimes = createTimes;
		this.status = status;
	}

	private Integer id;

    private String menuName;

    private String url;

    private Integer parentId;

    private Date createTime;
    
    private String createTimes;

    private Date updateTime;
    
    private String updateTimes;

    private Integer status;

}