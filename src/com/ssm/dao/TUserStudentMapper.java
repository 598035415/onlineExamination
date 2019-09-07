package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ssm.pojo.TUser;

@Repository
public interface TUserStudentMapper {
	List<TUser> StudentSelect(@Param("clazzId")String clazzId,@Param("limit")Integer limit,@Param("page")Integer page);
	
	Long StudentCountSelect();
}
