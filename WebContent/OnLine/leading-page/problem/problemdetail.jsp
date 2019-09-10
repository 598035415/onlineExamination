<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>GDUFE在线考试系统</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
<link rel="stylesheet"
	href="https://cdn.bootcss.com/highlight.js/9.12.0/styles/atom-one-dark.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/css/app.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/css/problem/problemdetail.css" />
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/highlight.js/9.12.0/highlight.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/OnLine/js/problem/problemdetail.js"></script>
</head>
<body>
<%@include file="/OnLine/common_head.jsp" %>
	<div class="ui header container">
		<div class="ui large breadcrumb">
			<a class="section"
				href="${pageContext.request.contextPath }/OnLine/leading-page/home.jsp"><i
				class="home icon"></i>首页</a> <i class="right chevron icon divider"></i>
			<a class="section"
				href="${pageContext.request.contextPath }/problemset">题库中心</a>
			<i class="right chevron icon divider"></i> <a class="section"
				href="${pageContext.request.contextPath }/problemlist?id=${param.categoryId}&categoryName=${param.categoryName}" >${param.categoryName }</a> <i
				class="right chevron icon divider"></i>
			<div class="active section" >题目详情</div>
		</div>
	</div>


	<div class="ui problemDetail container">
		<div class="ui secondary pointing menu">
			<a class="active item"><i class="block layout icon"></i>题目详情</a>
		</div>
		<div class="ui grid">
			<!-- 选择题,问答题 -->
			<div class="ten wide column">
				<div class="row">
					<div class="ui stacked segment">
						<h4 class="ui horizontal divider header">
							<i class="help circle icon"></i>题目描述
						</h4>
						<p style="font-size: 16px;" >${problemTrue.questionContent }</p>
					</div>
				</div>
				<!-- 选择题 -->
				<div
					if="${data['question'].questionType == 0 or data['question'].questionType == 1}"
					class="row" style="margin-top: 1em;">
					<div class="ui segment">
						<h4 class="ui horizontal divider header">
							<i class="hashtag icon"></i>题目选项
						</h4>
						<c:forEach items="${list }" var="problem">
							<div class="row" style="font-size: 16px;"><b>${problem.answerSelect }</b>. ${problem.answerContent }</div>
						</c:forEach>
					</div>
				</div>
				<div class="row" style="margin-top: 1em;">
					<!-- 显示与隐藏 ，需要自己js控制-->
					<div class="ui accordion segment active">
						<div class="title active">
							<i class="dropdown icon"></i>查看正确答案
						</div>
						<div class="content ui segment active">
							<h4 class="ui dividing header">
								正确答案:<span>${problemTrue.answerSelect }</span>
							</h4>
							<h4 class="ui dividing header">答案解析:</h4>
							<p style="font-size: 16px; font-weight: bold;">
								${problemTrue.answerTrueParse}
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="one wide column"></div>
			<div class="four wide column">
				<table class="ui table">
					<tbody>
						<tr>
							<td><span style="font-weight: bolder;">题目类型:</span></td>
							<td>
								<span>${problemTrue.label }</span>
							</td>
						</tr>
						<tr>
							<td><span style="font-weight: bolder;">上传者:</span></td>
							<td><span><i class="user icon"></i>admin</span></td>
						</tr>
					<tr>
                    <td><span style="font-weight: bolder;">发布时间:</span></td>
                    <td><span>${problemTrue.createTime }</span></td>
                </tr>
                <tr>
                    <td><span style="font-weight: bolder;">更新时间:</span></td>
                    <td><span >${problemTrue.updateTime }</span></td>
                </tr>
					</tbody>
				</table>
			</div>
			<div class="one wide column"></div>
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>