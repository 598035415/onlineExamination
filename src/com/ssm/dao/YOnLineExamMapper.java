package com.ssm.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ssm.common.ExamRowsQuestionAnser;
import com.ssm.pojo.TExamPaper;
import com.ssm.pojo.TExamPublish;
import com.ssm.pojo.TExamRecord;
import com.ssm.pojo.TStudentExamAnswer;
import com.ssm.pojo.TTestRecord;
import com.ssm.vo.YExamQuestionTrueSelectVO;
import com.ssm.vo.YExamQuestionVO;
import com.ssm.vo.YOnLineTaskListVO;
import com.ssm.vo.YUserTaskVO;

public interface YOnLineExamMapper {
	
	// 查询所有任务列表，并且存在的
	List<YOnLineTaskListVO> selectOnLineTaskListAndExsting();
	
	// 查询考场详情。根据任务id
	YOnLineTaskListVO selectOnLineExamRenderInfo(Integer taskId);
	
	// 查询该考场下的所有题目，根据任务id 一组问题
	List<YExamQuestionVO> selectQuestionAllByTaskId(Integer taskId);
	
	// 查询该考场下的所有题目，并且是正常的答案
	List<YExamQuestionVO> selectOnLineTaskQuestionAnswerTrue(Integer taskId);
	
	// 查询用户下的指定任务的问题和答案，
	@Select("	select id,exam_pulish_id as 'examPulishId',student_id as 'studentId' ,question_id as 'questionId',my_answer as 'myAnswer',`status` from t_student_exam_answer where `status` = 1 and student_id = #{0} and  exam_pulish_id=#{1}")
	List<TStudentExamAnswer>   selectStudentTaskAnswer(Integer userId,Integer taskId);
	
	// 当前问题的一组答案的正确选择。
	List<YExamQuestionTrueSelectVO> selectStudentExamAnswer(String[] arr);
	
	// 添加学生考试记录
	@Insert("insert into t_exam_record (exam_pulish_id,student_id,score,create_time) values (#{0},#{1},#{2},#{3})")
	Integer insertTxamRecord(Integer taskId,Integer studentId,Integer score,Date date);
	// 学生考试答案
	Integer insertStudentExamAnswer(@Param("taskId") Integer taskId,@Param("studentId")Integer studentId,@Param("qaList") List<ExamRowsQuestionAnser> questionAnserList );
	
	// 根据用户id查找并且根据taskId,考试记录
	@Select("select id,exam_pulish_id as 'examPulishId',student_id as 'studentId' from t_exam_record where student_id = #{0} and `status` = 1 and exam_pulish_id = #{1}")
	TExamRecord selectStudentRecord(Integer userId,Integer taskId); 
	
	// 更新记录，当前时间之前的所有启动时间，状态码为1  ,未进行
	@Update("update t_exam_publish set `current_type` = 1 where start_time > #{0}")
	Integer updateExamPublishStatusBefore (String currentTime);
	
	// 更新记录，介于开始时间和结束之间的 ，状态码为2，进行中 
	@Update("update t_exam_publish set `current_type` = 2 where #{0} BETWEEN start_time AND  end_time ")
	Integer updateExamPublishStatusBetweenAnd(String currentTime);
	
	// 更新记录，介于开始时间和结束之间的 ，状态码为3，已结束 
	@Update("update t_exam_publish set `current_type` = 3 where end_time < #{0} ")
	Integer updateExamPublishStatusAfter(String currentTime);
	
	// 根据id，查找单条记录
	@Select("select id,exam_id as examId ,`status`,clazz_id as 'clazzId' ,current_type as 'currentType' from t_exam_publish where `status` = 1 and id = #{0}")
	@ResultType(TExamPublish.class)
	TExamPublish selectExamTaskById(Integer taskId);
	
	
	// 查询所有考试任务记录
	List<YUserTaskVO> selectStudentTask(Serializable userId);
	// 查询所有练习记录
	List<TTestRecord> selectStudentExerciseTask(Serializable userId);
	
	// 查询所有的试卷并且存在的
	@Select("select * from t_exam_paper where `status` = 1")
	@ResultMap("com.ssm.dao.TExamPaperMapper.BaseRusltMap")
	List<TExamPaper> selectExamList();
	
}