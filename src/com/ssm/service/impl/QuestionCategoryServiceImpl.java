package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.QuestionCategoryDao;
import com.ssm.service.QuestionCategoryService;
import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;
import com.ssm.vo.QuestionCategoryVo;

@Service
public class QuestionCategoryServiceImpl implements QuestionCategoryService {

	@Autowired
	private QuestionCategoryDao qcd;
	
	@Override
	public ResponseEntity<List<QuestionCategoryVo>> pageQuestionCategory(Page pa) {
 ResponseEntity<List<QuestionCategoryVo>> re =new ResponseEntity<List<QuestionCategoryVo>>();
		 
		 List<QuestionCategoryVo> li = qcd.selecQuestionCategoryParent();
		 if( li!=null  && li.size()>0 ) {
				re.setMsg("成功");
				re.setData(li);
				re.setCount(   qcd.selecQuestionCategoryCount(pa) );
			}else {
				re.setMsg("无数据");
			}
		return re;
	}

	@Override
	public ResponseEntity<List<QuestionCategoryVo>> parentQuestionCategory( ) {
		 ResponseEntity<List<QuestionCategoryVo>> re =new ResponseEntity<List<QuestionCategoryVo>>();
		 List<QuestionCategoryVo> li = qcd.selecQuestionCategoryParent();
		 if( li!=null  && li.size()>0 ) {
				re.setMsg("成功");
				re.setData(li);
			}else {
				re.setMsg("无数据");
			}
		return re;
	}

	@Override
	public ResponseEntity<QuestionCategoryVo> addQuestionCategory(QuestionCategoryVo qcv) {
		// TODO Auto-generated method stub
		ResponseEntity<QuestionCategoryVo> re = new ResponseEntity<QuestionCategoryVo>();
		
		int exe =qcd.addQuestionCategory(qcv);
		if( exe>0 ) {
			re.setMsg("增加   一个类别   成功");
		}else {
			re.setMsg("增加   一个类别    失败   ："+qcv);
		}
		return re;
	}

	@Override
	public ResponseEntity<QuestionCategoryVo> upQuestionCategory(QuestionCategoryVo qcv) {
		ResponseEntity<QuestionCategoryVo> re = new ResponseEntity<QuestionCategoryVo>();
		
		int exe =qcd.upQuestionCategory(qcv);
		if( exe>0 ) {
			re.setMsg("修改   一个类别   成功");
		}else {
			re.setMsg("修改   一个类别    失败   ："+qcv);
		}
		return re;
	}

	@Override
	public ResponseEntity<QuestionCategoryVo> delQuestionCategory(QuestionCategoryVo qcv) {
		// TODO Auto-generated method stub
		ResponseEntity<QuestionCategoryVo> re = new ResponseEntity<QuestionCategoryVo>();
		int exe =qcd.delQuestionCategory(qcv);
		if( exe>0 ) {
			re.setMsg("删除   一个类别   成功");
		}else {
			re.setMsg("删除   一个类别    失败   ："+qcv);
		}
		return re;
	}

	@Override
	public ResponseEntity<QuestionCategoryVo> cu(QuestionCategoryVo qcv) {
		// 如果 有 ID  那么修改     没有 id 就增加
		if(  qcv.getId()==null ||  "".equals(qcv.getId() ) ) {
			return addQuestionCategory(qcv);
		}else {
			return upQuestionCategory(qcv);
		}
		
	}

}
