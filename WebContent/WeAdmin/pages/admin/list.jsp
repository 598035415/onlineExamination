<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>管理员列表-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css">

</head>
<body>
	<div class="weadmin-nav">
		<span class="layui-breadcrumb">
	      <a href="">首页</a>
	      <a href="">管理员管理</a>
	      <a>
	        <cite>管理员列表</cite></a>
	    </span>
		<a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
			<i class="layui-icon" style="line-height:30px">ဂ</i></a>
	</div>
	<div class="weadmin-body">
		<div class="layui-row">
			<form class="layui-form layui-col-md12 we-search">
				<div class="layui-inline">
					<input class="layui-input" placeholder="开始日" name="start" id="start">
				</div>
				<div class="layui-inline">
					<input class="layui-input" placeholder="截止日" name="end" id="end">
				</div>
				<div class="layui-inline">
					<input type="text" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
				<button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
			</form>
		</div>
		<div class="weadmin-block">
			<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
			<button class="layui-btn" onclick="WeAdminShow('添加用户','./WeAdmin/pages/admin/add.html')"><i class="layui-icon"></i>添加</button>
			<span class="fr" style="line-height:40px">共有数据：${userList.size() }条</span>
		</div>
		<table class="layui-table">
			<thead>
				<tr>
					<th>
						<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
					</th>
					<th>ID</th>
					<th>用户名</th>
					<th>密码</th>
					<th>生日</th>
					<th>创建日期</th>
					<th>最后一次登录时间</th>
					<th>状态</th>
					<th>操作</th>
			</thead>
			<tbody>
				<c:forEach items="${userList }" var="list">
						<tr>
							<td>
								<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
							</td>
							<td>${list.id }</td>
							<td>${list.username}</td>
							<td>${list.password }</td>
							<td>${list.birthdays }</td>
							<td>${list.createTimes }</td>
							<td>${list.lastLoginTimes }</td>
							<td>${list.status }</td>
							<td class="td-manage">
								<a title="编辑" onclick="WeAdminShow('编辑','./edit.jsp')" href="javascript:;">
									<i class="layui-icon">&#xe642;</i>
								</a>
								<a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
					</c:forEach>
			</tbody>
			</table>
			<div class="page">
				<div>
					<a class="prev" href="">&lt;&lt;</a>
					<a class="num" href="">1</a>
					<span class="current">2</span>
					<a class="num" href="">3</a>
					<a class="num" href="">489</a>
					<a class="next" href="">&gt;&gt;</a>
				</div>
			</div>
		</div>
	<script src="./WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
   	<script src="./WeAdmin/static/js/admin.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>