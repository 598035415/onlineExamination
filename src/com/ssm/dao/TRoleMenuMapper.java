package com.ssm.dao;

import com.ssm.pojo.TRoleMenu;

public interface TRoleMenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TRoleMenu record);

    int insertSelective(TRoleMenu record);

    TRoleMenu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TRoleMenu record);

    int updateByPrimaryKey(TRoleMenu record);
}