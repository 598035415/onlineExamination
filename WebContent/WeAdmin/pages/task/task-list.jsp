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
    <div class="weadmin-block">
    	<form action="javascript:void(0)" onsubmit="return false;" class="layui-form">
				<div class="demoTable " >
				
				   <div class="layui-inline">
				    <label class="layui-form-label">发布班级：</label>
				    <div class="layui-input-block">   
				      <select name="clazzId"   lay-filter="clazzId" style="width: 182px">
				        <option value=""></option>
				      	<c:forEach items="${clazzList}" var="clazz">
					        <option value="${clazz.id}">${clazz.clazzName}</option>
				      	</c:forEach>
				      </select>
				    </div>
				  </div>
				
				  <div class="layui-inline">
				    <label class="layui-form-label"> 发布状态：</label>
				    <div class="layui-input-block">
				      <select name="currentType" lay-filter="currentType"  style="width: 182px">
				        <option value=""></option>
				        <option value="1">未进行</option>
				        <option value="2">进行中</option>
				        <option value="3">已结束</option>
				      </select>
				    </div>
				  </div>
				  <button class="layui-btn" data-type="reload"><i class="layui-icon">&#xe615;</i>查找</button>
			        <div style="float: right;"><button  onclick="location.reload()" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe9aa;</i></button></div>
				</div>
    	</form>
        
    </div>
     <table class="layui-hide" id="test" lay-filter="test"></table>
    
</div>

<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-normal" lay-event="innerPublishTask"><i class="layui-icon layui-icon-util"></i>发布考试任务</button>
    <button class="layui-btn layui-btn-danger" lay-event="getCheckData"><i class="layui-icon layui-icon-delete"></i>批量删除</button>
  </div>
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.all.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/WeAdmin/static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>

<script>
	layui.use(['table','form','jquery','layer'], function(){
	  var table = layui.table;
	  var form = layui.form;
	  var $ = layui.jquery;
	  var layer = layui.layer;
	  table.render({
	    elem: '#test'
	    ,url:'${pageContext.request.contextPath}/task/list'
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	    ,title: '用户数据表'
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
	      ,{field:'examPaperTitle', title:'试卷标题', width:230, fixed: 'left', unresize: true}
	      ,{field:'clazzName', title:'发布班级', width:150, fixed: 'left', unresize: true}
	      ,{field:'currentType', title:'发布状态', width:90, fixed: 'left',templet:function(row){
	    		 if(row.currentType == 1){
	    			 return    '<button type="button" class="layui-btn layui-btn-warm layui-btn-sm">未进行</button>'
	    		 }else if (row.currentType == 2){
	    			 return    '<button type="button" class="layui-btn layui-btn-sm">进行中</button>'
	    		 }else if (row.currentType == 3){
	    			 return    '<button type="button" class="layui-btn layui-btn-danger layui-btn-sm">已结束</button>'
	    		 }
	      	}
	      }
	      ,{field:'status', title:'状态', width:90, fixed: 'left',templet:function(row){
	    	  if(row.status == 1){
	    		 return '<button type="button" class="layui-btn  layui-btn-sm">正常</button>';  
	    	  }else{
    			 return '<button type="button" class="layui-btn layui-btn-danger layui-btn-sm">删除</button>'
	    	  }
	    	  
	       	}
	      }
	      ,{field:'startTime', title:'开考时间', width:150, fixed: 'left', unresize: true}
	      ,{field:'endTime', title:'结束时间', width:150, fixed: 'left', unresize: true}
	       ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
	     ]]
	    ,id: 'testReload'
	    ,page: true
	  });
	  
	  //头工具栏事件
	  table.on('toolbar(test)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id);
	    if(obj.event=='getCheckData'){
	        var data = checkStatus.data;
	        var idArr = new Array();
	        if(data.length == 0 ){
	        	layer.msg("未选择数据！");
	        	return ;
	        }
	        for(var i = 0 ; i<data.length ;i++){
	        	idArr.push(data[i].id);
	        }
	        layer.confirm('确认要删除任务吗？', function(index){
		        layer.close(index);
		        $.ajax({
		        	url:"${pageContext.request.contextPath}/task/delete?ids="+idArr.join(),
		        	type:"POST",
		        	success:function(result){
		        		layer.msg(result.msg);
		        		setTimeout(function(){
		        			active['reload'].call(this);
						}, 1200);
		        	}
		        })
		        
		      });
	        
	    }else if (obj.event = 'innerPublishTask'){
	    	var url = "${pageContext.request.contextPath}/task/inner/publish";
	    	WeAdminInfo('发布考试任务',url);
	    	// 发布添加任务。
	    }
	  });
	  var $ = layui.$, active = {
			    reload: function(){
			      //执行重载
			      table.reload('testReload', {
			        page: {
			          curr: 1 //重新从第 1 页开始
			        }
			        ,where: {
			            clazzId: clazzId,
			            currentType:currentType
			        }
			      }, 'data');
			    }
			  };
	  //监听行工具事件
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    //console.log(obj)
	    if(obj.event === 'del'){
	      layer.confirm('确认要删除该任务吗？', function(index){
	        layer.close(index);
	        $.ajax({
	        	url:"${pageContext.request.contextPath}/task/delete?ids="+data.id,
	        	type:"POST",
	        	success:function(result){
	        		layer.msg(result.msg);
	        		
	        		setTimeout(function(){
	        			active['reload'].call(this);
					}, 1200);
	        	}
	        })
	        
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
	  var clazzId ='';
	  var currentType ='';
	  
	  	form.on('select(clazzId)',function(data){
	  		clazzId =  data.value;
	  	})
	  	form.on('select(currentType)',function(data){
	  		currentType =  data.value;
	  	})
	  
		  $('.demoTable .layui-btn').on('click', function(){
			  
			  var type = $(this).data('type');
		      active[type] ? active[type].call(this) : ''; 
		  });
	  
	});
</script>
</body>
</html>

