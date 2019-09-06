package com.ssm.dao;

import com.ssm.pojo.TStudentExamAnswer;

public interface TStudentExamAnswerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TStudentExamAnswer record);

    int insertSelective(TStudentExamAnswer record);

    TStudentExamAnswer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TStudentExamAnswer record);

    int updateByPrimaryKey(TStudentExamAnswer record);
}