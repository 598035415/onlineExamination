package com.ssm.service;

import java.util.List;

import com.ssm.util.LogBrokenLine;
import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;
import com.ssm.vo.TLogVo;

public interface LogService {
	
	public ResponseEntity<List<TLogVo>> pageLog(Page pa);
	
	public ResponseEntity<List<LogBrokenLine>> blLog(Page pa);
	
	public  ResponseEntity<TLogVo> addLog(TLogVo tlv);
	
	public  ResponseEntity<TLogVo> upLog(TLogVo tlv);
	
	public  ResponseEntity<TLogVo> delLog(TLogVo tlv);
	
	public ResponseEntity<TLogVo> cu(TLogVo tlv);
	
	
	
}
