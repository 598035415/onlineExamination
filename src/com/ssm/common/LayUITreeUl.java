package com.ssm.common;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

@Data
public class LayUITreeUl implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String title;
	private List<LayUITreeUl> children;
	private String href;
	private boolean spread;
	private boolean checked;
	private boolean disabled;
}
