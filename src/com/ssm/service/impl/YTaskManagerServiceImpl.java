package com.ssm.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.common.ServerResponse;
import com.ssm.dao.YTaskManagerMapper;
import com.ssm.pojo.CustomPublish;
import com.ssm.service.YTaskManagerService;
import com.ssm.util.LayUITableBean;
import com.ssm.vo.YExamQuestionVO;
import com.ssm.vo.YTaskListVo;

@Service
public class YTaskManagerServiceImpl implements YTaskManagerService {
	
	
	@Autowired
	private YTaskManagerMapper tmm;
	
	@Override
	public LayUITableBean<YTaskListVo> renderTaskList(Integer currentPage, Integer pageSize, Integer clazzId,
			Integer currentType) {
		// 开启分页
		PageHelper.startPage(currentPage, pageSize);
		PageInfo<YTaskListVo> pageInfo = new PageInfo<YTaskListVo>(tmm.renderTaskList(clazzId, currentType));
		LayUITableBean<YTaskListVo> layUITableBean = new LayUITableBean<YTaskListVo>();
		layUITableBean.setCount(pageInfo.getTotal());
		layUITableBean.setData(pageInfo.getList());
		return layUITableBean;
	}

	@Override
	public ServerResponse<Object> deleteTaskByIds(String ids) {
		String[] idArr = null;
		try {idArr = ids.split(",");} catch (Exception e) {return ServerResponse.createBySuccessMessage("参数不合理，删除失败！");}
		Integer deleteTaskByIds = this.tmm.deleteTaskByIds(idArr);
		if(deleteTaskByIds>0) {
			this.tmm.deleteClazzTask(idArr);
			this.tmm.deleteStudentRos(idArr);
			this.tmm.deleteStudentAsnwer(idArr);
		}
		return deleteTaskByIds >0 ? ServerResponse.createBySuccessMessage("删除成功，共："+ deleteTaskByIds+" 条") : ServerResponse.createBySuccessMessage("删除失败！");
	}
	/**
	 * 保存发布的任务
	 */
	@Override
	public ServerResponse<Object> savePublish(CustomPublish customPublish) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentDate  = new Date ();
		try {
			Date startTime= sdf.parse(customPublish.getStartTime());
			Date endTime = sdf.parse(customPublish.getEndTime());
			if (startTime.before(currentDate) && endTime.after(currentDate)) {
				customPublish.setCurrentType(2);
			}
			else if(startTime.before(currentDate) && endTime.before(currentDate)) {
				customPublish.setCurrentType(3);
			}else if (startTime.after(currentDate)) {
				customPublish.setCurrentType(1);
			}
		} catch (Exception e) {
			return ServerResponse.createByErrorMessage("时间传递不合法！");
		}
		return this.tmm.savePulish(customPublish)>0 ? ServerResponse.createBySuccessMessage("发布成功！") : ServerResponse.createByErrorMessage("发布失败！");
	}

	@Override
	public LayUITableBean<YExamQuestionVO> renderExamDetail(Integer page, Integer limit, Integer examId) {
		LayUITableBean<YExamQuestionVO> layUITableBean = new LayUITableBean<YExamQuestionVO>();
		PageHelper.startPage(page, limit);
		PageInfo<YExamQuestionVO> pageInfo = new PageInfo<YExamQuestionVO>(this.tmm.renderExamDetail(examId));
		layUITableBean.setCount(pageInfo.getTotal());
		layUITableBean.setData(pageInfo.getList());
		return layUITableBean;
	}

}
