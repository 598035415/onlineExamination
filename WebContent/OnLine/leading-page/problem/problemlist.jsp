<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<title>GDUFE在线考试系统</title>
<!-- 题目的所有题目 -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/css/app.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/css/problem/problemlist.css" />
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/OnLine/js/problem/problemlist.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/layui/css/layui.css"
	media="all">
</head>
<body>
<%@include file="/OnLine/common_head.jsp" %>
	<%-- <div class="ui fixed inverted menu">
		<a
			href="${pageContext.request.contextPath }/OnLine/leading-page/home.jsp"
			class="header item"> <!--<img class="ui" src="@{/img/logo_flat.png}" width="104" height="24" alt="" />-->
			<img class="ui"
			src="${pageContext.request.contextPath }/OnLine/img/logo.png"
			width="156" height="32" alt="" />
		</a> <a
			href="${pageContext.request.contextPath }/OnLine/contest/index.html"
			href="#" class="item"> <i class="desktop icon"></i>在线考试
		</a> <a href="javascript:void(0)" class="active item"> <i
			class="list layout icon"></i>题库中心
		</a>
		<!--<a onclick="'app.showLogin()'" class="right item" if="${current_account == null}">
        <i class="sign in icon"></i>登录
    </a>-->
		<a
			href="${pageContext.request.contextPath }/OnLine/my-homePage/myExam.html"
			class="item"> <i class="talk icon"></i>考试记录
		</a>

		<div class="ui simple dropdown right item">
			<img class="ui avatar image"
				src="${pageContext.request.contextPath }/OnLine/img/${preCurrentUser.headPortrait}" />
			<span text="${current_account.name}"></span> <i class="dropdown icon"></i>
			<div class="menu">
				<a class="item" href="${pageContext.request.contextPath }/profile">
					<i class="user icon"></i>我的主页
				</a> <a class="item" id="logout"> <i class="sign out icon"></i>退出
				</a>
			</div>
		</div>
	</div> --%>
	<div class="ui header container">
		<div class="ui large breadcrumb">
			<a class="section"
				href="${pageContext.request.contextPath }/OnLine/leading-page/home.jsp"><i
				class="home icon"></i>首页</a> <i class="right chevron icon divider"></i>
			<a class="section"
				href="${pageContext.request.contextPath }/problemset">题库中心</a> <i
				class="right chevron icon divider"></i>
			<div class="active section">${param.categoryName}</div>
		</div>
	</div>

	<div class="ui problemList container">
		<div class="ui secondary pointing menu">
			<a class="active item"><i class="list icon"></i>题目列表</a>
		</div>
		<div class="ui accordion segment">
			<!-- 筛选按钮的隐藏和显示，需要自己通过js控制。 -->
			<div class="title active">
				<i class="dropdown icon"></i>筛选
			</div>
			<!-- 搜索区域 -->
			<div class="content ui form segment active">
				<div class="two stackable fields">
					<div class="field">
						<label>题目描述</label> 
						<input id="keyword" placeholder="请输入相关题目描述" type="text" autocomplete="off"/>
					</div>
					<div class="field">
						<label>知识点</label> 
						<select id="questionCategory">
							<option value="">请选择知识点</option>
						</select>
					</div>
				</div>
				<button class="layui-btn query" data-type="reload">查询</button>
			</div>


		</div>

		<table class="layui-hide" id="test"></table>
		
		<script type="text/html" id="detail">
 			<a href="${pageContext.request.contextPath }/problemdetailQuery?categoryName=${param.categoryName}&problemId={{d.id}}&categoryId=${param.id}" class="tiny blue ui button" >详情</a>
		</script>
		
		<script type="text/javascript">
			
			$.get('${pageContext.request.contextPath }/problemListCategory', {
				categoryId : "${param.id}"
			}, function(data) {
				console.log(data);
				for (var i = 0; i < data.length; i++) {
					$("#questionCategory").append('<option value="'+data[i].id+'">'+data[i].categoryName+'</option>');
				}
			})
		</script>

		<script src="${pageContext.request.contextPath }/OnLine/layui/layui.js" charset="utf-8"></script>

		<script>
			layui.use(['table','form'], function() {
				var table = layui.table,
				form = layui.form;

			table.render({
					elem : '#test',
					url : '${pageContext.request.contextPath }/problemListTable?categoryId=${param.id}',
					cols : [ [ {
						field : 'questionContent',
						width : 700,
						title : '题目',
						align : 'center' 
					}, {
						field : 'questionCategory',
						width : 125,
						title : '知识点',
						align : 'center' 
					}, {
						field : 'questionType',
						width : 125,
						title : '题型',
						align : 'center' 
					}, {
						title : '操作',
						align : 'center',
						toolbar: '#detail'
					}] ]
					,page : true
					,id : 'problemlistTable'
					
				});
				
				$('.query').on('click', function(){
					table.reload('problemlistTable', {
						  where: { //设定异步数据接口的额外参数，任意设
							  keyword : $('#keyword').val(),
							  questionCategory : $('#questionCategory').val()
						  }
						  ,page: {
						    curr: 1 //重新从第 1 页开始
						  }
						}); //只重载数据
				  }); 
			});
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
					<!--
                TODO::pv,uv统计
                <span id='cnzz_stat_icon_1261763113'></span>
                <script src='@{//s95.cnzz.com/stat.php?id=1261763113&amp;online=1&amp;show=line}' type='text/javascript'></script>
                -->
				</div>
			</div>
		</div>
	</div>
	<script>
		/*$(function(){
		    app.init(contextPath);
		    problemListPage.init(pageNum, pageSize, totalPageNum, totalPageSize,problemsetId, questions);
		});*/
	</script>
	<script type="text/javascript">
		$(function() {
			app.init("${pageContext.request.contextPath}");
		});

		// 进入登录页面
		function innerLogin() {
			$('#loginModal').modal({
				/**
				 * 必须点击相关按钮才能关闭
				 */
				closable : false,
				/**
				 * 模糊背景
				 */
				blurring : true,
			}).modal('show');
		}
	</script>
</body>
</html>