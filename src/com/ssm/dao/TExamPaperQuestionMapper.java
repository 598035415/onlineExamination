package com.ssm.dao;

import com.ssm.pojo.TExamPaperQuestion;

public interface TExamPaperQuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TExamPaperQuestion record);

    int insertSelective(TExamPaperQuestion record);

    TExamPaperQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TExamPaperQuestion record);

    int updateByPrimaryKey(TExamPaperQuestion record);
}