package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.TDictMapper;
import com.ssm.dao.TQuestionCategoryMapper;
import com.ssm.dao.TQuestionMapper;
import com.ssm.pojo.TDict;
import com.ssm.pojo.TQuestionCategory;
import com.ssm.service.IQuestionService;
import com.ssm.util.ResponseCode;
import com.ssm.util.ServerResponse;
import com.ssm.vo.QuestionVo;

@Service
public class QuestionServiceImpl implements IQuestionService {

	@Autowired
	private TQuestionMapper questionMapper;

	@Autowired
	private TDictMapper dictMapper;

	@Autowired
	private TQuestionCategoryMapper categoryMapper;

	/**
	 * 查询试题列表
	 */
	@Transactional(rollbackFor = Exception.class, readOnly = true, propagation = Propagation.SUPPORTS)
	@Override
	public ServerResponse queryQuestionList(Integer pageNum, Integer pageSize) {
		if ((pageNum == null || pageNum.intValue() == 0) || (pageSize == null || pageSize.intValue() == 0)) {
			return ServerResponse.createByErrorMessage(ResponseCode.ILLEGAL_ARGUMENT.getDesc());
		}
		// 通过分页插件查询出分页的数据
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<QuestionVo> pageInfo = new PageInfo<>(questionMapper.queryQuestionList());
		// 返回结果集
		return ServerResponse.createBySuccess(pageInfo);
	}

	/**
	 * 通过字典表的type获取对应的字典属性
	 */
	@Transactional(rollbackFor = Exception.class, readOnly = true, propagation = Propagation.SUPPORTS)
	@Override
	public List<TDict> queryDictByType(Integer typeId) {
		return dictMapper.selectLabelByType(typeId);
	}

	/**
	 * 根据父id查询试题类别
	 */
	@Transactional(rollbackFor = Exception.class, readOnly = true, propagation = Propagation.SUPPORTS)
	@Override
	public ServerResponse selectCategoryByParentId(Integer parentId){
		if (parentId == null) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
		}
		return ServerResponse.createBySuccess(categoryMapper.selectCategoryByParentId(parentId));
	}
}
