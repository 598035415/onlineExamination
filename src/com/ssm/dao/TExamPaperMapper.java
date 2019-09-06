package com.ssm.dao;

import com.ssm.pojo.TExamPaper;

public interface TExamPaperMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TExamPaper record);

    int insertSelective(TExamPaper record);

    TExamPaper selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TExamPaper record);

    int updateByPrimaryKey(TExamPaper record);
}