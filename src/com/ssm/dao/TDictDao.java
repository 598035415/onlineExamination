package com.ssm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssm.pojo.TDict;
import com.ssm.util.Page;

@Repository
public interface TDictDao {
	
	public List<TDict> selectDictPage(Page pa);
	
	public Long selectDictCount(Page pa);
	
	
	public int upDict(TDict td);
	
	// insert into t_dict (lable,value,type,sort,create_time) values (#{label},#{value},#{type},#{sort},#{createTime})
	public int addDict(TDict td);
	
	
	
	//	update t_dict set status=#{status} where id=#{id}
	public int delDict(TDict td);
	
}