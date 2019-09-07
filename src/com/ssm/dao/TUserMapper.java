package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TUser;

public interface TUserMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TUser record);

    int insertSelective(TUser record);

    TUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
    
    TUser backgroundLogin(@Param("username")String username,@Param("password")String password);
    
    TUser frontDeskLogin(@Param("username")String username,@Param("password")String password);
    
    List<TUser> queryUserAll();
}