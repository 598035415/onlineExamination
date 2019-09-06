package com.ssm.dao;


public interface TUserMapper {
<<<<<<< HEAD
    int deleteByPrimaryKey(Integer id);

    int insert(TUser record);

    int insertSelective(TUser record);

    TUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
    
    TUser backgroundLogin(String username,String password);
=======
>>>>>>> branch 'mirror' of https://gitee.com/zztm/znsd-online-exam.git
}