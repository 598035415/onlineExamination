<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layui.form小例子</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/WeAdmin/lib/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/WeAdmin/lib/layui/layui.js"></script>

  
	<script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/jquery/jquery-3.3.1.min.js"></script>

</head>
<body>
<%
	pageContext.setAttribute("name", "张三");
	pageContext.setAttribute("bir", "1950-06-22");
%>

<%--  ${TDict} --%>
  
	<form class="layui-form"  style="width: 700px;margin: 0px auto;margin-top: 100px" >
		<div class="layui-form-item"  style="display: none;">
			<div class="layui-input-block">
				<input type="hidden" name="id" 
					autocomplete="off" placeholder="字典id"  value="${TDict.id}" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">字典说明</label>
			<div class="layui-input-block">
				<input type="text" name="label" lay-verify="title"
					autocomplete="off" placeholder="请输入权限名称"  value="${TDict.label }" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">字典值</label>
			<div class="layui-input-block">
				<input type="text" name="value" lay-verify="title"
					autocomplete="off" placeholder="请设置路径"  value="${TDict.value}" class="layui-input">
			</div>
		</div>
		
		
		<div class="layui-form-item" style="width: 400px" lay-filter="selectTest">
		    <label class="layui-form-label">字典类型</label>
		    <div class="layui-input-block">
		      <select name="type" lay-filter="aihao" lay-verify="required">	 
		      			
		      		  <c:if test="${TDict.type!=null}">
		      		  	<c:if test="${TDict.type=='1'}"><option value='${TDict.type}'>题目类型 </option></c:if>
		      		  	 <c:if test="${TDict.type=='2'}"><option value='${TDict.type}'>普通选项 </option></c:if>
		      		  	 <c:if test="${TDict.type=='3'}"><option value='${TDict.type}'>判断选项</option></c:if>
		      		  	 <c:if test="${TDict.type=='4'}"><option value='${TDict.type}'>测试 </option></c:if>
		      		  </c:if>
		      			
		       		   <option value='4'>测试</option>  
		      		   <option value='1'>题目类型</option>  
		      		   <option value='2'>普通选项</option>  
		      		   <option value='3'>判断选项</option>  
		      </select>
		    </div>
		</div>
			
		<div class="layui-form-item" style="width: 400px" lay-filter="selectTest">
		    <label class="layui-form-label">顺序</label>
		    <div class="layui-input-block">
		      <select name="sort" lay-filter="aihao" lay-verify="required">	     
		      		  <c:if test="${TDict.sort!=null}">
		      		  	 <option value='${TDict.sort} '>${TDict.sort} </option>  
		      		  </c:if>
		      		 	
		      		   <option value='1'>1</option>  
		      		   <option value='2'>2</option>  
		      		   <option value='3'>3</option>  
		      		   <option value='4'>4</option>  
		      		   <option value='5'>5</option>  
		      		   <option value='6'>6</option>  
		      		   <option value='7'>7</option>  
		      		   <option value='8'>8</option>  
		      		   <option value='9'>9</option>  
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
									if (value.length < 1) {
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
								
							//	layer.msg( JSON.stringify(data.field)   );
							
								//	var str ="user.id="+data.field.id+"&user.name="+data.field.name+"&user.age="+data.field.age ;		
								
								
								$.ajax(
									{
										url:"${pageContext.request.contextPath }/dictCU",
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
	</script>

</body>
</html>