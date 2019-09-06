package com.ssm.dao;

import com.ssm.pojo.TQuestion;

public interface TQuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TQuestion record);

    int insertSelective(TQuestion record);

    TQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TQuestion record);

    int updateByPrimaryKeyWithBLOBs(TQuestion record);

    int updateByPrimaryKey(TQuestion record);
}