<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>试题管理</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/lib/layui/css/layui.css"  media="all">
</head>

<body>
	<div class="weadmin-body">
	     <table class="layui-hide" id="test" lay-filter="test"></table>
	    
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.js"></script>
<script>
	layui.use(['table','form','jquery','layer'], function(){
	  var table = layui.table;
	  var form = layui.form;0
	  var $ = layui.jquery;
	  var layer = layui.layer;
	  table.render({
	    elem: '#test'
	    ,url:'${pageContext.request.contextPath}/task/exam/detail?examId=${examId}'
	    ,title: '考试题目详情'
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'questionId', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
	      ,{field:'questionContent', title:'题目内容', width:230, fixed: 'left', unresize: true}
	      ,{field:'questionScore', title:'题目分值', width:150, fixed: 'left', unresize: true}
	      ,{field:'questionType', title:'题目类型', width:90, fixed: 'left'}
	     ]]
	    ,page: true
	  });
	});
</script>
</body>
</html>

