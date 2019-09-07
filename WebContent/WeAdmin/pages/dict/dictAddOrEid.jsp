<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layui.form小例子</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/lib/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/lib/layui/layui.js"></script>

  
<script  src="${pageContext.request.contextPath }/js/jquery-1.12.4.js" type="text/javascript" ></script>

</head>
<body>
<%
	pageContext.setAttribute("name", "张三");
	pageContext.setAttribute("bir", "1950-06-22");
%>

 ${TDict}
  
	<form class="layui-form"  style="width: 700px;margin: 0px auto;margin-top: 100px" >
		<div class="layui-form-item"  style="display: none;">
			<div class="layui-input-block">
				<input type="hidden" name="id" 
					autocomplete="off" placeholder="权限id"  value="${power.id}" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">权限名称</label>
			<div class="layui-input-block">
				<input type="text" name="pname" lay-verify="title"
					autocomplete="off" placeholder="请输入权限名称"  value="${power.pname }" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">url</label>
			<div class="layui-input-block">
				<input type="text" name="url" lay-verify="title"
					autocomplete="off" placeholder="请设置路径"  value="${power.url}" class="layui-input">
			</div>
		</div>
		
		
		<div class="layui-form-item" style="width: 400px" lay-filter="selectTest">
		    <label class="layui-form-label">单行选择框</label>
		    <div class="layui-input-block">
		      <select name="parentId" lay-filter="aihao" lay-verify="required">
		      		 <option value='0'>自身为主菜单</option>  
		      		<%--  <option value='${admin.getRId()} '>${admin.name }</option>   --%>
		      </select>
		    </div>
		</div>
			
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="button" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>


	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use([ 'form', 'layedit', 'laydate' ],function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
						
							//日期
							laydate.render({
								elem : '#date',
								trigger : 'click'

							});

							//创建一个编辑器
							var editIndex = layedit.build('LAY_demo_editor');

							//自定义验证规则
							form.verify({
								title : function(value) {
									if (value.length < 2) {
										return '标题至少得2个字符啊';
									}
								},
								pass : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ],
								content : function(value) {
									layedit.sync(editIndex);
								}
							});

							//监听指定开关
							form.on('switch(switchTest)', function(data) {
								layer.msg('开关checked：'
										+ (this.checked ? 'true' : 'false'), {
									offset : '6px'
								});
								layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
										data.othis)
							});

							//监听提交
							form.on('submit(demo1)', function(data) {
								
								console.info(   JSON.stringify(data.field) );
								
							
								//	var str ="user.id="+data.field.id+"&user.name="+data.field.name+"&user.age="+data.field.age ;		
								
								$.ajax(
									{
										url:"${pageContext.request.contextPath }/powerAOU",
										dataType:"json",
										type:"post",
										data:data.field,
										success:function(result){
											layer.msg(    result.msg  );
											
											setTimeout(function(){
												var index = parent.layer.getFrameIndex(window.name);
												parent.layer.close(index);
											},"2000");
												
										},
										error:function(){
											layer.msg(    "异常"  );
										}
									}
								);
								return false;
							});
							
							
							$.ajax(
									{
										url:"${pageContext.request.contextPath }/powerAll",
										type:"post",
										dataType:"json",
										success:function(result){
											
											var list = result.data;
											
											for (var i = 1; i < list.length; i++) {
												$("select[lay-filter=aihao]").append("   <option value='"+list[i].id+"'>"+list[i].pname+"</option>  ");
											}
											
											
								
										  form.render('select'); //更新 lay-filter="test2" 所在容器内的全部 select 状态
										  //各种基于事件的操作，下面会有进一步介绍
										}
									}		
								);
							
							

							//表单初始赋值
							form.val('example', {
								"username" : "贤心" // "name": "value"
								,
								"password" : "123456",
								"interest" : 1,
								"like[write]" : true //复选框选中状态
								,
								"close" : true //开关状态
								,
								"sex" : "女",
								"desc" : "我爱 layui"
							})

						});
		
		
		$(document).ready(
			function(){
				
			
				
			
				
				
			}		
		);
		
	</script>

</body>
</html>