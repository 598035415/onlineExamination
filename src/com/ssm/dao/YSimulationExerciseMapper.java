package com.ssm.dao;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ssm.common.ExamRowsQuestionAnser;
import com.ssm.common.LayUITreeUl;
import com.ssm.pojo.TStudentExamAnswer;
import com.ssm.pojo.TTestRecord;
import com.ssm.vo.YExamQuestionVO;

public interface YSimulationExerciseMapper {
	
	// 根据父id查找所有子元素。并直接耦合LayUI的结构数据
	@Select("select id,category_name as 'title' from t_question_category where `status` = 1 and parent_id = #{0} ")
	List<LayUITreeUl> selectQuestionTypeByParentId(Serializable parentId);
	
	// 查询所有题目 ,limit后面的参数必须是数字，不能是字符串之类的。随机生成题目
	List<YExamQuestionVO> selectQuestionAllByTypeAndCount(@Param("checkeds")String[] checkeds,@Param("count")Integer count);
	
	// 查询所有题目，并携带正常答案
	List<YExamQuestionVO> selectQuestionAndAnswerList();
	
	// 根据类目，查找类型名
	List<String> selectQuestionTypeName(String[] questionTypes);
	
	// 生成测试记录，并生成一对多的测试答案记录
	Integer insertStudentTestRecord(TTestRecord tTestRecord);
	// 生成测试答案记录
	Integer insertStudentTestQuestion(@Param("testAnswerList") List<ExamRowsQuestionAnser> testAnswerList);
	

	
}