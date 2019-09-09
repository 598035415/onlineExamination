package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.TAnswerMapper;
import com.ssm.dao.TDictMapper;
import com.ssm.dao.TQuestionCategoryMapper;
import com.ssm.dao.TQuestionMapper;
import com.ssm.pojo.TAnswer;
import com.ssm.pojo.TDict;
import com.ssm.pojo.TQuestion;
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
	
	@Autowired
	private TAnswerMapper answerMapper;

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
	
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	@Override
	public ServerResponse addQuestion(TQuestion question, String[] answerContents, Integer checked,String[] answerSelect) {
		if (question == null || answerContents.length <= 0 || checked == null || answerSelect.length <= 0) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
		}
		
		questionMapper.addQuestion(question);
		
		for (int i = 0; i < answerContents.length; i++) {
			TAnswer answer = new TAnswer();
			answer.setQuestionId(question.getId());
			answer.setAnswerContent(answerContents[i]);
			answer.setAnswerSelect(answerSelect[i]);
			if (i == checked.intValue()) {
				answer.setIsAnswerTrue(1);
			} else {
				answer.setIsAnswerTrue(2);
			}
			answerMapper.addAnswer(answer);
		}
		return ServerResponse.createBySuccess();
	}
	
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	@Override
	public ServerResponse addMultiQuestion(TQuestion question, String[] answerContents, Integer[] checked, String[] answerSelects) {
		if (question == null || answerContents.length <= 0 || checked == null || answerSelects.length <= 0) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
		}
		questionMapper.addQuestion(question);
		for (int i = 0; i < answerContents.length; i++) {
			TAnswer answer = new TAnswer();
			answer.setQuestionId(question.getId());
			answer.setAnswerContent(answerContents[i]);
			answer.setAnswerSelect(answerSelects[i]);
			for (Integer check : checked) {
				if (i == check.intValue()) {
					answer.setIsAnswerTrue(1);
					break;
				}
			}
			if (answer.getIsAnswerTrue() == null) {
				answer.setIsAnswerTrue(2);
			}
			answerMapper.addAnswer(answer);
		}
		return ServerResponse.createBySuccess();
	}
	
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	@Override
	public ServerResponse addJudgeQuestion(TQuestion question, Integer judgeOption, Integer answerCount, Integer dataIndex) {
		if (question == null || judgeOption == null || answerCount == null || answerCount.intValue() != 2 || dataIndex == null || dataIndex.intValue() < 0) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
		}
		questionMapper.addQuestion(question);
		for (int i = 0; i < answerCount.intValue(); i++) {
			TAnswer answer = new TAnswer();
			answer.setQuestionId(question.getId());
			answer.setAnswerSelect(judgeOption.toString());
			if(i == dataIndex.intValue()) {
				answer.setIsAnswerTrue(1);
			} else {
				answer.setIsAnswerTrue(2);
			}
			answerMapper.addAnswer(answer);
		}
		return ServerResponse.createBySuccess();
	}
	
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
	@Override
	public ServerResponse delCheckedQuestion(Integer[] questionIds) {
		if (questionIds.length < 1) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
		}
		if(questionMapper.delCheckedQuestion(questionIds) > 0) {
			return ServerResponse.createBySuccess();
		}
		return ServerResponse.createByErrorMessage("删除失败！");
	}
	
	@Transactional(rollbackFor = Exception.class, readOnly = true, propagation = Propagation.SUPPORTS)
	@Override
	public TQuestionCategory selectCategoryByQuestionId(Integer questionId){
		if (questionId == null || questionId.intValue() < 1) {
			return null;
		}
		return categoryMapper.selectCategoryByQuestionId(questionId);
	}
	
	@Transactional(rollbackFor = Exception.class, readOnly = true, propagation = Propagation.SUPPORTS)
	@Override
	public ServerResponse selectAllSonCategory(Integer parentId) {
		if (parentId == null || parentId < 0) {
			return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
		}
		return ServerResponse.createBySuccess(categoryMapper.selectAllSonCategory(parentId));
	}
	
	@Transactional(rollbackFor = Exception.class, readOnly = true, propagation = Propagation.SUPPORTS)
	@Override
	public TQuestion selectQuestionById(Integer questionId) {
		if (questionId == null || questionId.intValue() < 1) {
			return null;
		}
		return questionMapper.selectQuestionById(questionId);
	}
}
