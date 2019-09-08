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
</head>
<body>
	<div class="ui fixed inverted menu">
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
	</div>
	<div class="ui header container">
		<div class="ui large breadcrumb">
			<a class="section"
				href="${pageContext.request.contextPath }/OnLine/leading-page/home.jsp"><i
				class="home icon"></i>首页</a> <i class="right chevron icon divider"></i>
			<a class="section"
				href="${pageContext.request.contextPath }/problemset">题库中心</a> <i
				class="right chevron icon divider"></i>
			<div class="active section" text="${data['subject'].name}">${param.categoryName}</div>
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
			<form class="content ui form segment active">
				<div class="two stackable fields">
					<div class="field">
						<label>题目描述</label> <input placeholder="请输入相关题目描述" type="text" />
					</div>
					<div class="field">
						<label>知识点</label> <select class="ui fluid dropdown">
							<option value="1">一星难度</option>
							<option value="2">两星难度</option>
							<option value="3">三星难度</option>
							<option value="4">四星难度</option>
							<option value="5">五星难度</option>
						</select>
					</div>
				</div>
				<input type="submit" class="positive ui button" value="查询" />
			</form>


		</div>
		<table class="ui table">
			<thead>
				<tr>
					<th class="ten wide">题目</th>
					<th class="second wide">知识点</th>
					<th class="second wide">题型</th>
					<th class="second wide">操作</th>
				</tr>
			</thead>
			<tbody>
				<tr each="item,itemStats : ${data['questions']}">
					<td><span text="${item.title}">一个作业的完成要经过若干加工步骤,每个步骤称为(
							)</span></td>
					<td>
						<div if="${item.difficulty == 1}" class="ui star rating"
							data-rating="1"></div>
						<div if="${item.difficulty == 2}" class="ui star rating"
							data-rating="2"></div>
						<div if="${item.difficulty == 3}" class="ui star rating"
							data-rating="3"></div>
						<div if="${item.difficulty == 4}" class="ui star rating"
							data-rating="4"></div>
						<div if="${item.difficulty == 5}" class="ui star rating"
							data-rating="5"></div>
					</td>
					<td><span if="${item.questionType == 0}">单选题</span> <!-- <span if="${item.questionType == 1}">多选题</span>
                <span if="${item.questionType == 2}">问答题</span>
                <span if="${item.questionType == 3}">编程题</span>--></td>
					<td><a href="problemdetail.html" class="tiny blue ui button">详情</a></td>
				</tr>
				<tr each="item,itemStats : ${data['questions']}">
					<td><span text="${item.title}">一个作业的完成要经过若干加工步骤,每个步骤称为2(
							)</span></td>
					<td>
						<div if="${item.difficulty == 1}" class="ui star rating"
							data-rating="1"></div>
						<div if="${item.difficulty == 2}" class="ui star rating"
							data-rating="2"></div>
						<div if="${item.difficulty == 3}" class="ui star rating"
							data-rating="3"></div>
						<div if="${item.difficulty == 4}" class="ui star rating"
							data-rating="4"></div>
						<div if="${item.difficulty == 5}" class="ui star rating"
							data-rating="5"></div>
					</td>
					<td><span if="${item.questionType == 0}">单选题</span> <!-- <span if="${item.questionType == 1}">多选题</span>
                <span if="${item.questionType == 2}">问答题</span>
                <span if="${item.questionType == 3}">编程题</span>--></td>
					<td><a href="problemdetail.html" class="tiny blue ui button">详情</a></td>
				</tr>
				<tr>
					<td><span>一个作业的完成要经过若干加工步骤,每个步骤称为( )</span></td>
					<td>
						<div class="ui star rating" data-rating="3"></div>
					</td>
					<td><span>单选题</span></td>
					<td><a class="tiny blue ui button">详情</a></td>
				</tr>
				<tr>
					<td><span>某保险公司多年的资料表明，在索赔户中，被盗索赔户占20%，以
							表示在随机抽查100个索赔户中因被盗而向保险公司索赔的户数，求 . x 0 0.5 1 1.5 2 2.5 3 Ф (x)
							0.500 0.691 0.841 0.933 0.977 0.994 0.999</span></td>
					<td>
						<div class="ui star rating" data-rating="3">io流</div>
					</td>
					<td><span>问答题</span></td>
					<td><a class="tiny blue ui button">详情</a></td>
				</tr>
				<tr>
					<td><span>写一个算法，逐层遍历一棵二叉树（从上到下，从左到右）</span></td>
					<td>
						<div class="ui star rating" data-rating="3"></div>
					</td>
					<td><span>编程题</span>spring</td>
					<td><a class="tiny blue ui button">详情</a></td>
				</tr>
				<tr>
					<td colspan="9" style="padding: 0px;"><div
							class="ui icon message" style="margin: 0px; box-shadow: none;">
							<i class="info circle icon"></i>
							<div class="content">
								<p>当前还没有题目呢！_(:зゝ∠)_</p>
							</div>
						</div></td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 分页 -->
	<div class="ui subPage container">
		<div class="ui pagination menu" id="subPageMenu">
			<a class="item"> 首页 </a> <a class="item"> 上一页 </a> <a
				class="active item"> 1 </a> <a class="item"> 2 </a> <a class="item">
				3 </a> <a class="item"> 4 </a> <a class="item"> 5 </a> <a class="item">
				6 </a> <a class="item"> 7 </a> <a class="item"> 8 </a> <a class="item">
				下一页 </a> <a class="item"> 末页 </a>
		</div>
	</div>
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
	<!-- 登录模态框 -->
	<div class="ui mini modal" id="loginModal">
		<div class="header">登录</div>
		<div class="content">
			<form class="ui form" id="loginModalForm">
				<div class="ui hidden negative message" id="loginModalErrorMessage">
					<!--
                <div class="header">错误提示</div>
                <p></p>
                -->
				</div>
				<div class="field required">
					<label>账号</label>
					<div class="ui left icon input">
						<input id="username" type="text" placeholder="请输入学号或教工号或指定账号" />
						<i class="user icon"></i>
					</div>
				</div>
				<div class="field required">
					<label>密码</label>
					<div class="ui left icon input">
						<input id="password" type="password" /> <i class="lock icon"></i>
					</div>
				</div>
				<div class="field">
					<div class="ui toggle checkbox">
						<input type="checkbox" id="rememberMe" name="rememberMe"
							tabindex="0" class="hidden" /> <label>记住登录</label>
					</div>
				</div>
				<div class="ui button" id="loginModalCloseButton">关闭</div>
				<div class="ui primary button" id="loginModalSubmitButton">登录</div>
			</form>
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
			home.init();
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