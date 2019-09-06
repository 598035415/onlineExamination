package com.ssm.dao;

import com.ssm.pojo.TClazzCate; 

public interface TClazzCateMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TClazzCate record);

    int insertSelective(TClazzCate record);

    TClazzCate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TClazzCate record);

    int updateByPrimaryKey(TClazzCate record);
}