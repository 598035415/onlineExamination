package com.ssm.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class MenuJson {
	private Integer id;
	private String title;
	private String name;
	private String url;
	List<MenuJson> children = new ArrayList<MenuJson>();
}
