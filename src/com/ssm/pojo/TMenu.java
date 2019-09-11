package com.ssm.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class TMenu {
	
	
	
    public TMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TMenu(String menuName, Integer parentId, String createTimes, Integer status,String url) {
		super();
		this.menuName = menuName;
		this.parentId = parentId;
		this.createTimes = createTimes;
		this.url = url;
		this.status = status;
	}

	private Integer id;
	
	private String icon;

    private String menuName;

    private String url;

    private Integer parentId;

    private Date createTime;
    
    private String createTimes;

    private Date updateTime;
    
    private String updateTimes;

    private Integer status;

}