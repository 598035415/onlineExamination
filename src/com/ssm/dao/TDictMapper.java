package com.ssm.dao;

import com.ssm.pojo.TDict;

public interface TDictMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TDict record);

    int insertSelective(TDict record);

    TDict selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TDict record);

    int updateByPrimaryKey(TDict record);
}