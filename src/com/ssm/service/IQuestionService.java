package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TAnswer;
import com.ssm.pojo.TDict;
import com.ssm.pojo.TQuestion;
import com.ssm.pojo.TQuestionCategory;
import com.ssm.util.ServerResponse;

public interface IQuestionService {
	ServerResponse queryQuestionList(Integer pageNum, Integer pageSize);
	
	List<TDict> queryDictByType(Integer typeId);
	
	ServerResponse selectCategoryByParentId(Integer parentId);
	
	ServerResponse addQuestion(TQuestion question, String[] answerContents, Integer checked,String[] answerSelect);
	
	ServerResponse addMultiQuestion(TQuestion question, String[] answerContents, Integer[] checked, String[] answerSelects);
	
	ServerResponse addJudgeQuestion(TQuestion question, Integer judgeOption, Integer answerCount, Integer dataIndex);
	
	ServerResponse delCheckedQuestion(Integer[] questionIds);
	
	TQuestionCategory selectCategoryByQuestionId(Integer questionId);
	
	ServerResponse selectAllSonCategory(Integer parentId);
	
	TQuestion selectQuestionById(Integer questionId);
	
	List<TAnswer> selectAnswerByQuestionId(Integer questionId);
	
	ServerResponse updateOneSelectQuestion(TQuestion question, String[] answerContents, Integer checked,Integer[] answerSelects);
	
	ServerResponse updateMultiQuestion(TQuestion question, String[] answerContents, Integer[] checked, Integer[] answerSelects);
	
	ServerResponse updateJudgeQuestion(TQuestion question, Integer answerCount, Integer checked, Integer[] answerSelects);
}
