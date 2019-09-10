<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>权限管理-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/lib/layui/css/layui.css"  media="all">
</head>
<body>
	<div class="weadmin-nav">
		<span class="layui-breadcrumb">
       <a href="">首页</a>
       <a href="">管理员管理</a>
       <a>
         <cite>权限管理</cite></a>
     </span>
		<a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
			<i class="layui-icon" style="line-height:30px">ဂ</i></a>
	</div>
	<div class="weadmin-body">
		<div class="weadmin-block">
			<button class="layui-btn" onclick="WeAdminShow('添加权限','WeAdmin/pages/admin/addRule.jsp')"><i class="layui-icon"></i>添加</button>
			<span class="fr" style="line-height:40px">共有数据：${menuList.size() } 条</span>
		</div>
		<table class="layui-table">
			<thead>
				<tr>
					<th>
						<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
					</th>
					<th>ID</th>
					<th>权限名称</th>
					<th>创建时间</th>
					<th>操作</th>
			</thead>
			<tbody>
				<c:forEach items="${menuList }" var="list">
						<tr>
							<td>
								<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
							</td>
							<td>${list.id }</td>
							<td>${list.menuName}</td>
							<td>${list.createTimes }</td>
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
	<script src="${pageContext.request.contextPath}/WeAdmin/static/js/admin.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
   		function member_del(id){
   			$ = layui.jquery;
   			layer.confirm('确认要删除吗？', function(index) {
   				$.ajax({
   					url:"deleteMenu",
   					data:"menuId="+id,
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