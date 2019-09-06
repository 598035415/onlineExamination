package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TMenu;

public interface TMenuService {
	List<TMenu> selectById(Integer userId);
}
