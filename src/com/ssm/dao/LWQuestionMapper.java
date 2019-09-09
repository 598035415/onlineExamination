package com.ssm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.TQuestion;
import com.ssm.vo.ProblemDetailVO;

public interface LWQuestionMapper {


	List<TQuestion> problemListTable(Map<String, Object> map);

	Integer problemListTableCount(Map<String, Object> map);

	List<ProblemDetailVO> problemdetailQuery(@Param("problemId")String problemId);
}
