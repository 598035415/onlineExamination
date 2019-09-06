package com.ssm.dao;

import com.ssm.pojo.TClazzType;

public interface TClazzTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TClazzType record);

    int insertSelective(TClazzType record);

    TClazzType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TClazzType record);

    int updateByPrimaryKey(TClazzType record);
}