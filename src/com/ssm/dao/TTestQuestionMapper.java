package com.ssm.dao;

import com.ssm.pojo.TTestQuestion;

public interface TTestQuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TTestQuestion record);

    int insertSelective(TTestQuestion record);

    TTestQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TTestQuestion record);

    int updateByPrimaryKey(TTestQuestion record);
}