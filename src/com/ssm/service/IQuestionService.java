package com.ssm.service;

import java.util.List;

import com.ssm.pojo.TDict;
import com.ssm.util.ServerResponse;

public interface IQuestionService {
	ServerResponse queryQuestionList(Integer pageNum, Integer pageSize);
	
	List<TDict> queryDictByType(Integer typeId);
}
