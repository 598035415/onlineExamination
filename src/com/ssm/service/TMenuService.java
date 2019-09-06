package com.ssm.service;

import java.util.List;

import com.ssm.vo.MenuJson;

public interface TMenuService {
	List<MenuJson> selectById(Integer userId);
}
