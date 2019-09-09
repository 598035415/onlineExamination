<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加管理员-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/lib/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="../../static/css/font.css">
	<link rel="stylesheet" href="../../static/css/weadmin.css">
  </head>
<body>
	<div class="layui-form-item">
	  <label class="layui-form-label">角色名：</label>
	  <div class="layui-input-inline">
	    <input type="text" name="roleName" lay-verify="required" placeholder="请输入角色名字" autocomplete="off" class="layui-input">
	  </div>
	</div>
	<div style="position: relative; left: 30px; bottom: 20px;">
		<div id="test5" class="demo-tree"></div>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
		</fieldset>
	</div>
	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
	    </div>
	</div>
	<script src="../../lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="../../static/js/jquery.js" ></script>
	<script>
	layui.use(['tree', 'util'], function(){
	  var tree = layui.tree
	  ,layer = layui.layer
	  ,util = layui.util
	  ,data2 = [{
		    title: '早餐'
		        ,id: 1
		        ,children: [{
		          title: '油条'
		          ,id: 5
		        },{
		          title: '包子'
		          ,id: 6
		        },{
		          title: '豆浆'
		          ,id: 7
		        }]
		      },{
		        title: '午餐'
		        ,id: 2
		        ,checked: true
		        ,children: [{
		          title: '藜蒿炒腊肉'
		          ,id: 8
		        },{
		          title: '西湖醋鱼'
		          ,id: 9
		        },{
		          title: '小白菜'
		          ,id: 10
		        },{
		          title: '海带排骨汤'
		          ,id: 11
		        }]
		      },{
		        title: '晚餐'
		        ,id: 3
		        ,children: [{
		          title: '红烧肉'
		          ,id: 12
		          ,fixed: true
		        },{
		          title: '番茄炒蛋'
		          ,id: 13
		        }]
		      },{
		        title: '夜宵'
		        ,id: 4
		        ,children: [{
		          title: '小龙虾'
		          ,id: 14
		          ,checked: true
		        },{
		          title: '香辣蟹'
		          ,id: 15
		          ,disabled: true
		        },{
		          title: '烤鱿鱼'
		          ,id: 16
		        }]
		      }];
		  //开启复选框
		  tree.render({
		    elem: '#test5'
		    ,data: data2
		    ,showCheckbox: true
		  });
	  });
	</script>
</body>
</html>