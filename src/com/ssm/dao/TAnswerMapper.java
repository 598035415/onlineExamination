package com.ssm.dao;

import com.ssm.pojo.TAnswer;

public interface TAnswerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TAnswer record);

    int insertSelective(TAnswer record);

    TAnswer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TAnswer record);

    int updateByPrimaryKey(TAnswer record);
}