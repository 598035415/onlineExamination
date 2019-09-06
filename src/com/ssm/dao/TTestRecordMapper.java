package com.ssm.dao;

import com.ssm.pojo.TTestRecord;

public interface TTestRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TTestRecord record);

    int insertSelective(TTestRecord record);

    TTestRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TTestRecord record);

    int updateByPrimaryKey(TTestRecord record);
}