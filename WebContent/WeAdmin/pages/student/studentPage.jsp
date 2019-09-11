<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>学生管理</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css">
	</head>

	<body>
		<!-- <div class="weadmin-nav">
			<span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">管理员管理</a>
        <a>
          <cite>学生管理</cite></a>
     	</span>
			<a class="layui-btn layui-btn-sm" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
				<i class="layui-icon" style="line-height:30px">ဂ</i></a>
		</div> -->
		<div class="weadmin-body">
			
			<table class="layui-hide" id="test" lay-filter="test"></table>
		
		</div>
		<script type="text/html" id="toolbarDemo">
  			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-sm" lay-event="getStudentAdd"><i class="layui-icon"></i>增加</button>
  			</div>
		</script>
		<script type="text/html" id="barDemo">
  			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		<script src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
    	<script src="${pageContext.request.contextPath}/WeAdmin/static/jquery-3.4.1.min.js" type="text/javascript" ></script>
    	<script>
			layui.use('table', function(){
			  var table = layui.table;
			  table.render({
			    elem: '#test'
			    ,url:'${pageContext.request.contextPath}/StudentSelect?clazzId=${userid}'
			    ,toolbar: '#toolbarDemo'
			    ,title: '班级信息表'
			    ,cols: [[
			      {type: 'checkbox', fixed: 'left'}
			      ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true}
			      ,{field:'username', title:'名称', width:80}
			      ,{field:'password', title:'密码', width:100}
			      ,{field:'gender', title:'性别', width:80,templet: function(res){
			    	  if(res.gender==1){
			    		  return '男'
			    	  }else{
			    		  return '女'
			    	  }
			        }}
			      ,{field:'birthdays', title:'生日', width:150}
			      ,{field:'clazzId', title:'班级Id', width:60}
			      ,{field:'createTimes', title:'增加时间', width:150}
			      ,{field:'updateTimes', title:'修改时间', width:150}
			      ,{field:'lastLoginTime', title:'最后登录时间', width:150}
			      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
			    ]]
			    ,page: true
			    ,limit: 5
			    ,limits:[5,10,15]
			    
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
			      case 'getStudentAdd':
			    	  layer.open({
					        formType: 2,
				        	type:2,
				        	content:"${pageContext.request.contextPath}/StudentAddPage?clazzId=${userid}",
				        	area:['1000px','550px'],
				        	title:'增加学生'
					   })
			      break;
			    };
			  });
			  //监听行工具事件
			  table.on('tool(test)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'del'){
			      layer.confirm('真的删除行么', function(index){
			        $.ajax({
			        	url:"${pageContext.request.contextPath}/StudentDelete",
			        	data:"userid="+data.id,
			        	type:"post",
			        	dataType:"JSON",
			        	success:function(result){
			        		if(result.status===1){
						        obj.del();
			        			layer.msg("删除成功", {
									icon: 1
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
		        	content:"${pageContext.request.contextPath}/updateSelect?id="+data.id,
		        	area:['900px','550px'],
		        	title:'修改学生'
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