package com.ssm.dao;

import com.ssm.pojo.TClazz;

public interface TClazzMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TClazz record);

    int insertSelective(TClazz record);

    TClazz selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TClazz record);

    int updateByPrimaryKey(TClazz record);
}