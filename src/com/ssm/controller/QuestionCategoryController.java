package com.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.ssm.common.GlobalSessionUser;
import com.ssm.pojo.TUser;
import com.ssm.service.QuestionCategoryService;
import com.ssm.util.Page;
import com.ssm.util.ResponseEntity;
import com.ssm.vo.QuestionCategoryVo;
import com.ssm.vo.TLogVo;

@Controller
public class QuestionCategoryController {

	@Autowired
	private QuestionCategoryService qcs;
	
	@RequestMapping("tomcat")
	public void tomcat() {
		
		System.out.println(    System.getProperty("catalina.home")    );
	}
	
	@RequestMapping("qcPage")
	@ResponseBody
	public String qcPage(Page pa) {
		ResponseEntity<List<QuestionCategoryVo>> re  = qcs.pageQuestionCategory(pa);
		return JSON.toJSONString(re);
	}
	
	@RequestMapping("qcParent")
	@ResponseBody
	public String qcParent() {
		ResponseEntity<List<QuestionCategoryVo>> re  = qcs.parentQuestionCategory();
		return JSON.toJSONString(re);
	}
	
	@RequestMapping("qcDel")
	@ResponseBody
	public String qcDel(QuestionCategoryVo qcv) {
		ResponseEntity<QuestionCategoryVo> re  = qcs.delQuestionCategory(qcv);
		return JSON.toJSONString(re);
	}
	
	@RequestMapping("qcCU")
	@ResponseBody
	public String qcCU(QuestionCategoryVo qcv,HttpSession  session) {
		// 设置 增加 和 修改时间
		Date da=new Date();
		qcv.setCreateTime(da);
		qcv.setUpdateTime(da);
		//设置修改人
		TUser tu=(TUser) session.getAttribute("user");
		//  将修改人 加进去
		if (tu!=null) {
			qcv.setCreatePerson(tu.getUsername());
		}
		
		ResponseEntity<QuestionCategoryVo> re  = qcs.cu(qcv);
		return JSON.toJSONString(re);
	}
	
	
	@RequestMapping("/qcHead2")
	@ResponseBody
	public String  headPortrait( HttpServletRequest req) throws IllegalStateException, IOException {
		ResponseEntity<QuestionCategoryVo> re  =new ResponseEntity<QuestionCategoryVo>();
		
		System.out.println(   req.getServletPath()  );
		System.out.println(   req.getServletContext()  );
		System.out.println(  req.getServletContext().getRealPath("")  );
		
		
		
		String path = req.getServletContext().getRealPath("/OnLine/img");
		System.out.println(path);
		
		return null;
	}
	
	
	
	
	@RequestMapping("qcHead")
	@ResponseBody
	public String  headPortrait(@RequestParam(required=false)MultipartFile file, HttpServletRequest req) throws IllegalStateException, IOException {
		ResponseEntity<QuestionCategoryVo> re  =new ResponseEntity<QuestionCategoryVo>();
		if (file == null) {
			re.setMsg("上传文件 不能 为空");
			re.setCode("-1");
			return JSON.toJSONString(re);
		}
		
		String path = req.getServletContext().getRealPath("/OnLine/img");
//		System.out.println(path);
		String fileName = file.getOriginalFilename();
	    // 创建文件实例
	    File filePath = new File(path, fileName);
	    // 如果文件目录不存在，创建目录
	    if (!filePath.getParentFile().exists()) {
	        filePath.getParentFile().mkdirs();
	        System.out.println("创建目录" + filePath);
	    }
	    // 写入文件
	    file.transferTo(filePath);
	    
		re.setMsg(file.getOriginalFilename());
		
		return JSON.toJSONString(re);
	}
	
	
	
	@RequestMapping("qcGoCU")
	public void logGoCU(HttpServletRequest request,HttpServletResponse response,QuestionCategoryVo qcv) throws ServletException, IOException {
		init(request, response);
		
		request.setAttribute("qc",qcv);
		
		request.getRequestDispatcher("WeAdmin/pages/question/questionCategoryAddOrEid.jsp").forward(request, response);
		
	}
	public void init(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	@Autowired
	private QuestionCategoryDao qcd;
	
	@RequestMapping("quTest")
	@ResponseBody
	public String test(Page pa) {
		
		pa.setPage(0);
		pa.setLimit(10);
		
		System.out.println(  "数量 ："+qcd.selecQuestionCategoryCount(pa)  );
		System.out.println( "一级菜单："+qcd.selecQuestionCategoryParent() );
		
		
		QuestionCategoryVo qcv = new QuestionCategoryVo();
		
		qcv.setCategoryName("测试 ");
		qcv.setParentId(0);
		qcv.setCategoryPicture("6666666666.jpg");
		qcv.setCategoryName("测试人员");
		qcv.setCreateTime(new Date());
		qcv.setCreatePerson("小学生智力");
		System.out.println( "增加："+ qcs.addQuestionCategory(qcv));
		
		
		qcv.setCategoryName("测试--- ");
		qcv.setParentId(9);
		qcv.setCategoryPicture("6666666666---.jpg");
		qcv.setCategoryName("测试人员---");
		qcv.setUpdateTime(new Date());
		System.out.println("修改："+qcs.upQuestionCategory(qcv)   );
		
		
		System.out.println("删除："+qcs.delQuestionCategory(qcv));
		
		return qcs.pageQuestionCategory(pa).toString();
	}*/
	
	
}
