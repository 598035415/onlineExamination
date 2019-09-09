package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TUser;
import com.ssm.util.ResponseEntity;

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
    
    Integer lastLoginTime(@Param("id")Integer id);
    
    //判断用户名是否存在
    TUser selectByUserName(@Param("username")String username);
    
    //增加用户
    Integer addUser(TUser user);
    
}