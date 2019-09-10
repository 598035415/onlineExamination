<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>角色管理-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css">
	<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
	<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>		
<body>
	<div class="weadmin-nav">
	<span class="layui-breadcrumb">
      <a href="">首页</a>
      <a href="">管理员管理</a>
      <a>
        <cite>角色管理</cite></a>
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
		<button class="layui-btn" onclick="WeAdminShow('添加角色','WeAdmin/pages/admin/addRole.jsp')"><i class="layui-icon"></i>添加</button>
		<span class="fr" style="line-height:40px">共有数据：88 条</span>
	</div>
	<table class="layui-table">
		<thead>
			<tr>
				<th>
					<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
				</th>
				<th>ID</th>
				<th>角色名</th>
				<th>创建时间</th>
				<th>状态</th>
				<th>操作</th>
		</thead>
			<tbody>
				<c:forEach items="${roleList }" var="list">
						<tr>
							<td>
								<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
							</td>
							<td>${list.id }</td>
							<td>${list.roleName}</td>
							<td>${list.createTimes }</td>
							<td>${list.status }</td>
							<td class="td-manage">
							<a title="删除" onclick="member_del(${list.id})" href="javascript:;">
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
	<script src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/WeAdmin/static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/WeAdmin/static/js/admin.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
   		function member_del(id){
   			$ = layui.jquery;
   			layer.confirm('确认要删除吗？', function(index) {
   				$.ajax({
   					url:"deleteRole",
   					data:"roleId="+id,
   					type:"post",
   					success:function(data){
   						if(data.code==200){
   						 	layer.msg(data.msg, {icon: 6},function(){
   						 		window.parent.location.reload();
   						 	}); 
   						}else{
   							layer.msg(data.msg, {icon: 5},function(){
   						 		window.parent.location.reload();
   						 	});
   						}
   						
   					}
   				})
   			});
   		}
   	</script>
</body>
</html>