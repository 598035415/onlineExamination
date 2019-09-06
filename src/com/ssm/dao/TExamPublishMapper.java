package com.ssm.dao;

import com.ssm.pojo.TExamPublish;

public interface TExamPublishMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TExamPublish record);

    int insertSelective(TExamPublish record);

    TExamPublish selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TExamPublish record);

    int updateByPrimaryKey(TExamPublish record);
}