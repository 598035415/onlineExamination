package com.ssm.dao;

import com.ssm.pojo.TExamRecord;

public interface TExamRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TExamRecord record);

    int insertSelective(TExamRecord record);

    TExamRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TExamRecord record);

    int updateByPrimaryKey(TExamRecord record);
}