package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.TQuestionMapper;
import com.ssm.service.IQuestionService;
import com.ssm.util.LayUIPageBean;
import com.ssm.util.ResponseCode;
import com.ssm.util.ServerResponse;
import com.ssm.vo.QuestionVo;

@Service
public class QuestionServiceImpl implements IQuestionService {
	
	@Autowired
	private TQuestionMapper questionMapper;
	
	/**
	 * 查询试题列表
	 */
	public ServerResponse queryQuestionList(Integer pageNum, Integer pageSize){
		if ((pageNum == null || pageNum.intValue() == 0) || (pageSize == null || pageSize.intValue() == 0)) {
			return ServerResponse.createByErrorMessage(ResponseCode.ILLEGAL_ARGUMENT.getDesc());
		}
		//通过分页插件查询出分页的数据
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<QuestionVo> pageInfo = new PageInfo<>(questionMapper.queryQuestionList());
		//返回结果集
		return ServerResponse.createBySuccess(pageInfo);
	}
}
