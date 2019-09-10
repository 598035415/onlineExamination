package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TDict;
import com.ssm.pojo.TQuestion;
import com.ssm.pojo.TQuestionCategory;
import com.ssm.util.ServerResponse;
import com.ssm.vo.QuestionParticularsVo;

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
	
	QuestionParticularsVo selectDetails(String id);
	
	
}
