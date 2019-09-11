<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<title>GDUFE在线考试系统</title>
<!-- 重置密码 -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
<link rel="stylesheet"
	href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/css/user/password.css" />
<link rel="stylesheet"
	href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/css/app.css" />
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/OnLine/js/user/password.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/layui/css/layui.css"
	media="all">
<script src="${pageContext.request.contextPath }/OnLine/layui/layui.js"
		charset="utf-8"></script>
</head>
<body>
	<%@include file="/OnLine/common_head.jsp"%>

	<div class="ui main container">
		<div class="ui grid">
			<%@include file="/OnLine/common_center_left.jsp"%>
			<div class="twelve wide column">
				<div class="ui segment">
					<h4 class="ui dividing header">更改密码</h4>
					<form class="ui form attached fluid segment">
						<div class="ui hidden negative message"
							id="updatePasswordErrorMessage">
							<!--
                        <div class="header">错误提示</div>
                        <p></p>
                        -->
						</div>
						<div class="field">
							<label>旧密码</label> <input id="oldPassword" name="oldPassword"
								placeholder="请输入旧密码" type="password" />
							<span id="oldPasswordError" style="color:red;"></span>
						</div>
						<div class="field">
							<label>新密码</label> <input id="newPassword" name="newPassword"
								placeholder="请输入新密码" type="password" />
								<span id="newPasswordError" style="color:red;"></span>
						</div>
						<div class="field">
							<label>确认密码</label> <input id="confirmNewPassword"
								name="confirmNewPassword" placeholder="请再次输入新密码" type="password" />
								<span id="confirmNewPasswordError" style="color:red;"></span>
						</div>
						<div class="positive ui button" id="updatePasswordButton">提交</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	layui.use("form", function(){
		var $ = layui.jquery
		
		var oldPassword = $("#oldPassword");
		var newPassword = $("#newPassword");
		var confirmNewPassword = $("#confirmNewPassword");
		$("#updatePasswordButton").on('click', function(){
			$.ajax({
				url : '${pageContext.request.contextPath }/updatePassword',
				type : 'post',
				data : {
					oldPassword : oldPassword.val(),
					newPassword : newPassword.val(),
					confirmNewPassword : confirmNewPassword.val()
				},
				success : function(result){
					layer.msg(result.error);
					if (result.success != null) {
						layer.msg(result.success);
					}
				}
				
			})
		})
	
		oldPassword.blur(function(){
			
			$.ajax({
				url : '${pageContext.request.contextPath }/updatePassword',
				type : 'post',
				data : {
					oldPassword : oldPassword.val()
				},
				success : function(result){
					if ("旧密码输入错误" === result.error) {
						$("#oldPasswordError").text(result.error)
					}else{
						$("#oldPasswordError").empty();
					}
				}
			})
		})
		newPassword.blur(function(){
			if(newPassword.val().length < 6){
				$("#newPasswordError").text("新密码长度必须大于6位")
			}else{
				$("#newPasswordError").empty();
			}
		})
		confirmNewPassword.blur(function(){
			if(confirmNewPassword.val() != $("#newPassword").val()){
				$("#confirmNewPasswordError").text("两次密码不同")
			}else{
				$("#confirmNewPasswordError").empty();
			}
		})
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
			var num = 1;
			$("#navigationLink .content:eq("+num+")").append("<i class='pointing left icon'></i>")
		})
	</script>
</body>
</html>