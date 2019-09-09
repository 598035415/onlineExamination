package com.ssm.dao;

import java.util.List;
import java.util.Map;


import com.ssm.pojo.TQuestion;

public interface LWQuestionMapper {


	List<TQuestion> problemListTable(Map<String, Object> map);

	Integer problemListTableCount(Map<String, Object> map);
}
