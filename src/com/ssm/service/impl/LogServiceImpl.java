package com.ssm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TLogDao;
import com.ssm.service.LogService;
import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;
import com.ssm.vo.TLogVo;

@Service
public class LogServiceImpl implements LogService{
	
	@Autowired
	private TLogDao tld;

	@Override
	public ResponseEntity<List<TLogVo>>  pageLog(Page pa) {
		ResponseEntity<List<TLogVo>>  re =  new 	ResponseEntity<List<TLogVo>>();
		//  计算 分页
		pa.setPage( (pa.getPage()-1)*pa.getLimit());
		List<TLogVo> li=tld.selecLogPage(pa);
		
		if( li!=null  ) {
			re.setMsg("成功");
			re.setData(li);
			re.setCount( tld.selecLogCount(pa) );
		}else {
			re.setMsg("无数据");
		}
		return re;
	}

	@Override
	public ResponseEntity<TLogVo> addLog(TLogVo tlv) {
		
		// 定义时间 
		tlv.setCreateTime(new Date());
		ResponseEntity<TLogVo> re= new ResponseEntity<TLogVo>();
		
		int exe =tld.addLog(tlv);
		if( exe>0 ) {
			re.setMsg("增加   一条日志   成功");
		}else {
			re.setMsg("增加   一条日志     失败   ："+tlv);
		}
		return re;
	}

	@Override
	public ResponseEntity<TLogVo> upLog(TLogVo tlv) {
		
		// 定义时间 
		tlv.setUpdateTime(new Date());
		ResponseEntity<TLogVo> re= new ResponseEntity<TLogVo>();
		int exe =tld.upLog(tlv);
		if( exe>0 ) {
			re.setMsg("修改   一条日志   成功");
		}else {
			re.setMsg("修改   一条日志     失败   ："+tlv);
		}
		return re;
	}

	@Override
	public ResponseEntity<TLogVo> delLog(TLogVo tlv) {
		// TODO Auto-generated method stub
		
		ResponseEntity<TLogVo> re= new ResponseEntity<TLogVo>();
		int exe =tld.delLog(tlv);
		if( exe>0 ) {
			re.setMsg("删除   一条日志   成功");
		}else {
			re.setMsg("删除   一条日志     失败   ："+tlv);
		}
		return re;
	}

	@Override
	public ResponseEntity<TLogVo> cu(TLogVo tlv) {
		// TODO Auto-generated method stub
		// 如果 有 ID  那么修改     没有 id 就增加
		if(  tlv.getId()==null ||  "".equals(tlv.getId() ) ) {
			return addLog(tlv);
		}else {
			return upLog(tlv);
		}
	}
	
	
	
}
