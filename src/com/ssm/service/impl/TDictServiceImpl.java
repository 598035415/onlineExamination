package com.ssm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.TDictDao;
import com.ssm.pojo.TDict;
import com.ssm.service.TDictService;
import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;

@Service
public class TDictServiceImpl implements TDictService{
	
	@Autowired
	private TDictDao tdd;



	@Override
	public ResponseEntity<List<TDict>> pageDict(Page pa) {
		
		ResponseEntity<List<TDict>> re =  new ResponseEntity<List<TDict>>();
		//  计算 分页
		pa.setPage( (pa.getPage()-1)*pa.getLimit());
		List<TDict> li=tdd.selectDictPage(pa);
		
		if( li!=null  ) {
			re.setMsg("成功");
			re.setData(li);
			re.setCount(tdd.selectDictCount(pa));
		}else {
			re.setMsg("无数据");
		}
		return re;
	}



	@Override
	public ResponseEntity<TDict> addDict(TDict td) {
		//  人为 创建 创建时间
		td.setCreateTime(new Date());
		
		ResponseEntity<TDict> re =  new ResponseEntity<TDict>();
		int exe=tdd.addDict(td);
		
		if( exe>0 ) {
			re.setMsg("增加   一个数据   成功");
		}else {
			re.setMsg("删除   数据字典     失败   ："+td);
		}
		
		return re;
	}

	@Override
	public ResponseEntity<TDict> upDict(TDict td) {
		// 人为 创造  修改时间
		td.setUpdateTime(new Date());
		ResponseEntity<TDict> re =  new ResponseEntity<TDict>();
		int exe=tdd.upDict(td);
		
		if( exe>0 ) {
			re.setMsg("修改   一个数据   成功");
		}else {
			re.setMsg("修改   数据字典     失败   ："+td);
		}
		
		return re;
	}



	@Override
	public ResponseEntity<TDict> delDict(TDict td) {
		ResponseEntity<TDict> re =  new ResponseEntity<TDict>();
		int exe=tdd.delDict(td);
		
		if( exe>0 ) {
			re.setMsg("删除   一个数据   成功");
		}else {
			re.setMsg("删除   数据字典     失败   ："+td);
		}
		
		return re;
	}


	
	@Override
	public ResponseEntity<TDict> cu(TDict td) {		
		//  如果   有 ID  那么就是 修改       不然就是增加
		if(  td.getId()==null ||  "".equals(td.getId() ) ) {
			return addDict(td);
		}else {
			return upDict(td);
		}
	}
	
	
	
}
