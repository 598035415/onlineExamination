<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<title>GDUFE在线考试系统</title>
<!-- 个人信息 -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
<link rel="stylesheet"
	href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/css/app.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/css/user/profile.css" />
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/OnLine/js/user/profile.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/layui/css/layui.css"
	media="all">
</head>
<body>
	<%@include file="/OnLine/common_head.jsp"%>

	<div class="ui main container">
		<div class="ui grid">
			<%@include file="/OnLine/common_center_left.jsp"%>
			
			<div class="twelve wide column">
				<div class="ui segment">
					<h4 class="ui dividing header">基本信息</h4>
					<form class="ui form attached fluid segment layui-form" id="updateAccountForm">
						<div class="ui hidden negative message"
							id="updateAccountErrorMessage">
							<!--
                        <div class="header">错误提示</div>
                        <p></p>
                        -->
						</div>
						<div class="field">
							<label><i class="user icon"></i>用户名</label> <input id="myName"
								name="myName" readonly="" type="text"
								value="${ preCurrentUser.username}" />
						</div>
						<div class="field">
							<label>
							<i class="student icon"></i>性别
							</label> 
							&nbsp;&nbsp;
							${preCurrentUser.gender == 1 ? checked:'' }
							<input type="radio" name="gender" value="1"  ${preCurrentUser.gender != 1 ? "":"checked"  }/>男
							&nbsp;&nbsp;
							<input type="radio" name="gender" value="2" ${preCurrentUser.gender != 2 ? "":"checked" }/>女
						</div>
						<div class="field">
							<label><i class="qq icon"></i>生日</label> 
							<div class="layui-input-inline">
      							<input type="text" name="birthday" id="date" lay-verify="date" 
      							placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" 
      							value=
      							<fmt:formatDate value="${preCurrentUser.birthday }"  type="date" dateStyle="default"/>
      							>
     						</div>
						</div>
						
						
						<div class="field">
							<label><i class="upload icon"></i>跟换头像</label>
							<div class="layui-upload">
							  <button type="button" class="layui-btn" id="test1">上传图片</button>
							  <div class="layui-upload-list">
							    <img class="layui-upload-img" id="demo1" width="200px" height="200px">
							    <p id="demoText"></p>
							  </div>
							</div>   
						</div>
						<button type="button" lay-submit class="layui-btn" id="test9"  lay-filter="demo1">保存</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath }/OnLine/layui/layui.js"
		charset="utf-8"></script>
	<script type="text/javascript">
		layui.use(['laydate','upload','form'], function(){
			var laydate = layui.laydate,
			$ = layui.jquery,
			upload = layui.upload
			form = layui.form;
			
			form.on('submit(demo1)', function(data){
			    /* layer.alert(JSON.stringify(data.field), {
			      title: '最终的提交信息'
			    }) */
			    $.ajax({
			    	url : '${pageContext.request.contextPath }/updateUser',
			    	type : 'post',
			    	data : data.field,
			    	success : function(result){
			    		if (result.success != null) {
							layer.msg(result.success,{time: 3000},function(){
					    		window.location.reload();
							})
						}else{
				    		layer.msg(result.error);
						}
			    	}
			    })
			    return false;
			  });
			
			//渲染日期
			laydate.render({
			    elem: '#date'
			});
			
			var uploadInst = upload.render({
			    elem: '#test1'
			    ,url: '${pageContext.request.contextPath }/headPortrait'
			    ,size: 10000
			    ,auto: false
			    ,bindAction: '#test9'
			    ,before: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#demo1').attr('src', result); //图片链接（base64）
			      });
			    }
			    ,done: function(res){
			    	layer.msg(result.success,{time: 3000},function(){
			    		window.location.reload();
					})
			    }
			    ,error: function(){
			      //演示失败状态，并实现重传
			      var demoText = $('#demoText');
			      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			      demoText.find('.demo-reload').on('click', function(){
			        uploadInst.upload();
			      });
			    }
			  });
			
		})
	</script>
	
	<!-- 不可抗力元素 -->
	<div class="second-footer"></div>
	<div id="footer">
		<div class="ui container">
			<div class="ui stackable two columns grid">
				<div class="column">
					<div class="ui two columns grid">
						<div class="column">
							<h3>项目介绍</h3>
							在线考试系统是一个在线测试学习系统，并用于辅助课程教学和学生学习。
						</div>
						<div class="column">
							<h3>联系我们</h3>
							如有问题请发邮件到 zzqnxx@foxmail.com
						</div>
					</div>
				</div>
				<div class="right aligned column">
					&copy; 2018 GDUFE All Rights Reserved &nbsp;&nbsp; <br /> 网站版本：<a
						href="#">v1.0.0 Beta #20180109</a>&nbsp;&nbsp; 服务器时间：<span
						id="current_server_timer"></span> <br /> 站长统计 | 今日IP[91] |
					今日PV[4511] | 昨日IP[133] | 昨日PV[10109] | 当前在线[1]
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			//num 是当前页面数 profile = 0 password = 1 myExam = 2 myExercise = 3
			var num = 0;
			$("#navigationLink .content:eq("+num+")").append("<i class='pointing left icon'></i>")
		})
	</script>
	
</body>
</html>