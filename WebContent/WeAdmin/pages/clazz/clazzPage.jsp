<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>班级管理</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="../../static/css/font.css">
		<link rel="stylesheet" href="../../static/css/weadmin.css">
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
			
		<table class="layui-hide" id="test" lay-filter="test"></table>
			
		</div>
		<script src="../../lib/layui/layui.js" charset="utf-8"></script>
    	<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
    	<script>
			layui.use('table', function(){
			  var table = layui.table;
			  
			  table.render({
			    elem: '#test'
			    ,url:'clazzSelect'
			    ,toolbar: '#toolbarDemo'
			    ,title: '班级信息表'
			    ,cols: [[
			      {type: 'checkbox', fixed: 'left'}
			      ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
			      ,{field:'clazzName', title:'班级名称', width:120, edit: 'text'}
			      ,{field:'userId', title:'教师Id', width:80}
			      ,{field:'createTime', title:'增加时间', width:120}
			      ,{field:'updateTime', title:'修改时间', width:120}
			      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
			    ]]
			    ,page: true
			  });
			  
			  //头工具栏事件
			  table.on('toolbar(test)', function(obj){
			    var checkStatus = table.checkStatus(obj.config.id);
			    switch(obj.event){
			      case 'getCheckData':
			        var data = checkStatus.data;
			        layer.alert(JSON.stringify(data));
			      break;
			      case 'getCheckLength':
			        var data = checkStatus.data;
			        layer.msg('选中了：'+ data.length + ' 个');
			      break;
			      case 'isAll':
			        layer.msg(checkStatus.isAll ? '全选': '未全选');
			      break;
			    };
			  });
			  
			  //监听行工具事件
			  table.on('tool(test)', function(obj){
			    var data = obj.data;
			    //console.log(obj)
			    if(obj.event === 'del'){
			      layer.confirm('真的删除行么', function(index){
			        obj.del();
			        layer.close(index);
			      });
			    } else if(obj.event === 'edit'){
			      layer.prompt({
			        formType: 2
			        ,value: data.email
			      }, function(value, index){
			        obj.update({
			          email: value
			        });
			        layer.close(index);
			      });
			    }
			  });
			});
			</script>
	</body>

</html>