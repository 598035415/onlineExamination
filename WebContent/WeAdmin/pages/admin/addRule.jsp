<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/layui/css/layui.css"  media="all">
</head>
<body>
          
	              
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>添加权限</legend>
	</fieldset>
	<form class="layui-form" action="">
		<div class="layui-form-item">
		  <label class="layui-form-label">权限名</label>
		  <div class="layui-input-inline">
		    <input type="text" name="menuName" lay-verify="required" placeholder="请输入权限名" autocomplete="off" class="layui-input">
		  </div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">请选择节点</label>
		    <div class="layui-input-inline">
		      <select name="parentId" class="sel" id="addd">
		        <option value="">请选择</option>
		      </select>
		    </div>
		  </div>
		  
		  <div class="layui-form-item">
			  <label class="layui-form-label">url地址</label>
			  <div class="layui-input-inline">
			    <input type="text" name="url" lay-verify="required" placeholder="请输入url地址" autocomplete="off" class="layui-input">
			  </div>
		 </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
		    </div>
		  </div>
    </form>
	 
	<script src="${pageContext.request.contextPath}/WeAdmin/static/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use(['form', 'layedit', 'jquery' ,'laydate'], function(){
		  var form = layui.form
		  ,layer = layui.layer
		  ,layedit = layui.layedit
		  ,laydate = layui.laydate
		  $ = layui.jquery;
		  
		  $.ajax({
			  url:"../../../parentMenu",
			  type:"post",
			  dataType:"json",
			  success:function(data){
				for (var i = 0; i < data.length; i++) {
					 var option = "<option value="+data[i].id+">"+data[i].title+"</option>"
					 $("#addd").append(option)
				}
				form.render('select'); //刷新select选择框渲染
			  }
		  })
		  
		  //日期
		  laydate.render({
		    elem: '#date'
		  });
		  laydate.render({
		    elem: '#date1'
		  });
		  
		  //创建一个编辑器
		  var editIndex = layedit.build('LAY_demo_editor');		  
		  //监听提交
		  form.on('submit(demo1)', function(data){
			 $.ajax({
				 url:"../../../addMenu",
				 type:"post",
				 dataType:"json",
				 data:data.field,
				 success:function(data){
					if(data.code==200){
						layer.msg(data.msg, {icon: 6},function () {
		                     var index = parent.layer.getFrameIndex(window.name);
		                     parent.layer.close(index);
		                     window.parent.location.reload();
		                     window.parent.parent.location.reload();
		                 }); 
					}
				 }
			 }) 
		    return false;
		  });		  
		});
</script>
</body>
</html>