package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TDict;
import com.ssm.pojo.TQuestion;
import com.ssm.util.ServerResponse;

public interface IQuestionService {
	ServerResponse queryQuestionList(Integer pageNum, Integer pageSize);
	
	List<TDict> queryDictByType(Integer typeId);
	
	ServerResponse selectCategoryByParentId(Integer parentId);
	
	ServerResponse addQuestion(TQuestion question, String[] answerContents, Integer checked,String[] answerSelect);
	
	ServerResponse addMultiQuestion(TQuestion question, String[] answerContents, Integer[] checked, String[] answerSelects);
	
	ServerResponse addJudgeQuestion(TQuestion question, Integer judgeOption, Integer answerCount, Integer dataIndex);
	
	ServerResponse delCheckedQuestion(Integer[] questionIds);
}
