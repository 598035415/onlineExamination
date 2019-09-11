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
		<table class="layui-hide" id="test" lay-filter="test"></table>
			
		</div>
		<script type="text/html" id="toolbarDemo">
  			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-sm" lay-event="getClazzAdd"><i class="layui-icon"></i>增加</button>
  			</div>
		</script>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="examination">发布考试</a>
			<a class="layui-btn layui-btn-xs" lay-event="selectStudent">查询学生</a>
			<a class="layui-btn layui-btn-xs" lay-event="performance">历史成绩</a>
  			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		<script src="../../lib/layui/layui.js" charset="utf-8"></script>
    	<script src="../../static/jquery-3.4.1.min.js" type="text/javascript" ></script>
    	<script>
			layui.use('table', function(){
			  var table = layui.table;
			  table.render({
			    elem: '#test'
			    ,url:'${pageContext.request.contextPath}/clazzSelect?userid=1'
			    ,toolbar: '#toolbarDemo'
			    ,title: '班级信息表'
			    ,cols: [[
			      {type: 'checkbox', fixed: 'left'}
			      ,{field:'id', title:'ID', width:100, fixed: 'left', unresize: true}
			      ,{field:'clazzName', title:'班级名称', width:160}
			      ,{field:'createTimes', title:'增加时间', width:150}
			      ,{field:'updateTimes', title:'修改时间', width:150}
			      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:360}
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
			      case 'getClazzAdd':
			    	  layer.open({
					        formType: 2,
				        	type:2,
				        	content:"${pageContext.request.contextPath}/clazzAddPageResponse?userId=1",
				        	area:['900px','600px'],
				        	title:'增加班级'
					   })
			      break;
			    };
			  });
			  //监听行工具事件
			  table.on('tool(test)', function(obj){
				
			    var data = obj.data;
			    //console.log(obj)
			    if(obj.event === 'del'){
			      layer.confirm('真的删除行么', function(index){
			        $.ajax({
			        	url:"${pageContext.request.contextPath}/clazzUpdate",
			        	data:"userId="+data.id,
			        	type:"post",
			        	dataType:"JSON",
			        	success:function(result){
			        		if(result.status===1){
						        obj.del();
			        			layer.msg("删除成功", {
									icon: 1
								}, function() {
									var index = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index);
								});
			        		}else{
			        			layer.msg("删除失败", {
									icon: 5
								});
			        		}
			        	}
			        })
			        layer.close(index);
			      });
			    } else if(obj.event === 'edit'){
			      layer.open({
			        formType: 2,
		        	type:2,
		        	content:"${pageContext.request.contextPath}/clazzUpdateSelect?clazzId="+data.id,
		        	area:['900px','600px'],
		        	title:'修改班级'
			      }, function(value, index){
			        obj.update({
			          email: value
			        });
			        layer.close(index);
			      });
			    }else if(obj.event==='selectStudent'){
			    	layer.open({
				        formType: 2,
			        	type:2,
			        	content:"${pageContext.request.contextPath}/pageTranspond?clazzId="+data.id,
			        	area:['1100px','700px'],
			        	title:'查询学生'
				    })
			    }else if(obj.event==='examination'){
			    	layer.open({
				        formType: 2,
			        	type:2,
			        	content:"${pageContext.request.contextPath}/innerExamPage?clazzId="+data.id,
			        	area:['1100px','600px'],
			        	title:'发布考试'
				    })
			    }else if(obj.event==='performance'){
			    	layer.open({
				        formType: 2,
			        	type:2,
			        	content:"${pageContext.request.contextPath}/selectTask?clazzId="+data.id,
			        	area:['1000px','600px'],
			        	title:'历史成绩',
				    })
			    }
			  });
			});
			</script>
	</body>

</html>