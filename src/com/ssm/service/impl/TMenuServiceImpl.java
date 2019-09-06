package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TMenuMapper;
import com.ssm.pojo.TMenu;
import com.ssm.service.TMenuService;

@Service
public class TMenuServiceImpl implements TMenuService {
	
	@Autowired
	private TMenuMapper dao ; 
	
	@Override
	public List<TMenu> selectById(Integer userId) {
		return dao.selectById(userId);
	}

}
