package com.ssm.dao;

import com.ssm.pojo.TLog;

public interface TLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TLog record);

    int insertSelective(TLog record);

    TLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TLog record);

    int updateByPrimaryKey(TLog record);
}