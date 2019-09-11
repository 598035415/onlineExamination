package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.CustomPublish;
import com.ssm.util.LayUITableBean;
import com.ssm.vo.YExamQuestionVO;
import com.ssm.vo.YTaskListVo;

public interface YTaskManagerMapper {
	// json查询
	public List<YTaskListVo> renderTaskList(@Param("clazzId")Integer clazzId,@Param("currentType")Integer currentType);
	// 批量删除
	public Integer deleteTaskByIds(String[] idArr);
	public Integer deleteClazzTask(String[] idArr);
	public Integer deleteStudentRos(String[] idArr);
	public Integer deleteStudentAsnwer(String[] idArr);
	// 发布任务
	@Insert("insert into t_exam_publish (exam_id,clazz_id,start_time,end_time,current_type) values (#{examId},#{clazzId},#{startTime},#{endTime},#{currentType})")
	public Integer savePulish(CustomPublish task);
	
	// 考试详情。
	public List<YExamQuestionVO> renderExamDetail(Integer examId);
	
	
	
}