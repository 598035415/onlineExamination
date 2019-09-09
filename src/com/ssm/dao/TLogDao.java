package com.ssm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssm.util.Page;
import com.ssm.vo.TLogVo;

@Repository
public interface TLogDao {
	
	//  带 分页 的 查询
	public List<TLogVo> selecLogPage(Page pa);
	
	public Long selecLogCount(Page pa);
	
	// INSERT INTO t_log (msg,login_ip,login_name,create_time) VALUES (#{msg},#{loginIp},#{loginName},#{createTime});
	public int addLog(TLogVo tlv );
	
	public int upLog(TLogVo tlv );
	
	// update t_Log set status=2 where id=#{id}
	public int delLog(TLogVo tlv );
	
	
	
	
	
}