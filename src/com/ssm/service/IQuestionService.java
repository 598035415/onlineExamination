package com.ssm.service;

import com.ssm.util.ServerResponse;

public interface IQuestionService {
	ServerResponse queryQuestionList(Integer pageNum, Integer pageSize);
}
