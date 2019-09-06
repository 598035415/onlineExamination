package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.TestPojo;

public interface TestDao {
	public List<TestPojo> selectAll();
}
