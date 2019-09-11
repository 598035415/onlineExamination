package com.ssm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.LWPersonalCenterMapper;
import com.ssm.dao.YOnLineExamMapper;
import com.ssm.pojo.TTestRecord;
import com.ssm.service.PersonalCenterService;
import com.ssm.vo.YUserTaskVO;

@Service
public class PersonalCenterServiceImpl implements PersonalCenterService {

	@Autowired
	private LWPersonalCenterMapper lwPersonalCenterMapper;
	
	@Autowired
	private YOnLineExamMapper yOnLineExamMapper;
	
	
	
	@Override
	public String updateHeadPortrait(Integer id, String fileName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("headPortrait", fileName);
		Integer userUpdate = lwPersonalCenterMapper.userUpdate(map);
		if (userUpdate > 0) {
			return "success";
		}
		return "failure";
	}

	@Override
	public String updatePassword(Integer id, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		Integer userUpdate = lwPersonalCenterMapper.userUpdate(map);
		if (userUpdate > 0) {
			return "success";
		}
		return "failure";
	}

	@Override
	public String updateUser(Integer id, String gender, String birthday) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("gender", gender);
		map.put("birthday", birthday);
		Integer userUpdate = lwPersonalCenterMapper.userUpdate(map);
		if (userUpdate > 0) {
			return "success";
		}
		return "failure";
	}

	@Override
	public Map<String, Object> getMyExam(Integer id) {
		List<YUserTaskVO> selectStudentTask = yOnLineExamMapper.selectStudentTask(id);
		List<String> data1 = new ArrayList<String>();
		List<String> data2 = new ArrayList<String>();
		for (int i = 0; i < selectStudentTask.size(); i++) {
			data1.add( selectStudentTask.get(i).getExam_paper_title() );
			System.out.println(selectStudentTask.get(i).getScore());
			data2.add( selectStudentTask.get(i).getScore().toString() );
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1", data1);
		map.put("data2", data2);
		return map;
	}

	@Override
	public Map<String, Object> getExercise(Integer id) {
		List<TTestRecord> selectStudentExerciseTask = yOnLineExamMapper.selectStudentExerciseTask(id);
		List<String> data1 = new ArrayList<String>();
		List<String> data2 = new ArrayList<String>();
		for (int i = 0; i < selectStudentExerciseTask.size(); i++) {
			data1.add( selectStudentExerciseTask.get(i).getTestName() );
			System.out.println(selectStudentExerciseTask.get(i).getAccuracy());
			data2.add( selectStudentExerciseTask.get(i).getAccuracy().replace("%", "") );
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1", data1);
		map.put("data2", data2);
		return map;
	}
	
	

}
