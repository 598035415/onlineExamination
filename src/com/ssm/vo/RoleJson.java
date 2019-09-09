package com.ssm.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class RoleJson {
	private String title;
	private Integer id;
	private List<RoleJson> children = new ArrayList<RoleJson>();
}
