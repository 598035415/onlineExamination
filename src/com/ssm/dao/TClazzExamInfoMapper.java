package com.ssm.dao;

import com.ssm.pojo.TClazzExamInfo;

public interface TClazzExamInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TClazzExamInfo record);

    int insertSelective(TClazzExamInfo record);

    TClazzExamInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TClazzExamInfo record);

    int updateByPrimaryKey(TClazzExamInfo record);
}