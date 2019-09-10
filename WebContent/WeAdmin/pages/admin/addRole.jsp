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
	    <input type="text" name="roleName"  lay-verify="required" placeholder="请输入角色名字" autocomplete="off" class="layui-input">
	  </div>
	</div>
	<div style="position: relative; left: 30px; bottom: 20px;">
		<div id="test5" class="demo-tree"></div>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
		</fieldset>
	</div>
	
	<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="add" lay-filter="demo1">立即提交</button>
    </div>
  </div>
	
	
	<script src="../../lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="../../static/js/jquery.js" ></script>
	<script>
	layui.use(['form','tree','jquery','util'], function(){
		var tree = layui.tree
		  ,layer = layui.layer
		  ,util = layui.util
		  ,form = layui.form
		  ,$ = layui.jquery;
		
		$.ajax({
		  url:"../../../treeMenu",
		  type:"post",
		  dataType:"json",
		  success:function(data){
			  tree.render({
			    elem: '#test5'
			    ,data: data
			    ,showCheckbox: true
			  });
		  }
		})
		
		form.on('submit(demo1)', function(data){
			var checkedArr = new Array();
			var roleName = $(".layui-input").val();
		    $("#test5 input[type ='checkbox']:checked").each(function(i){
			    checkedArr.push(this.value);
		    })			
		    $.ajax({
		    	url:"../../../addRole",
		    	type:"post",
				dataType:"json",
				data:"menuIds="+checkedArr+"&roleName="+roleName,
				success:function(data){
					 layer.msg(data.msg, {icon: 6},function () {
	                     var index = parent.layer.getFrameIndex(window.name);
	                     parent.layer.close(index);
	                     window.parent.location.reload();
	                 });  
				}
			}),
		 })
	  })
	 </script>
	 <script src="${pageContext.request.contextPath}/WeAdmin/static/js/admin.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>