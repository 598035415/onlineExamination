package com.ssm.dao;

import java.util.List;
import com.ssm.vo.QuestionVo;

public interface TQuestionMapper {
	
	List<QuestionVo> queryQuestionList();
}