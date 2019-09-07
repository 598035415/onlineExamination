package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TDict;
import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;

public interface TDictService {
	
	public ResponseEntity<List<TDict>> pageDict(Page pa);
	
	public  ResponseEntity<TDict> addDict(TDict td);
	
	public  ResponseEntity<TDict> upDict(TDict td);
	
	public  ResponseEntity<TDict> delDict(TDict td);
	
	public ResponseEntity<TDict> cu(TDict td);
	
}
