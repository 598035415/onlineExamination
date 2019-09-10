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
	<script  src="${pageContext.request.contextPath }/js/jquery-1.12.4.js" type="text/javascript" ></script>
</head>
<body>
<%
	pageContext.setAttribute("name", "张三");
	pageContext.setAttribute("bir", "1950-06-22");
%>


	<%-- ${qp } --%>
	
	<hr>
  
	<form class="layui-form  layui-form-pane"  style="width: 700px;margin: 0px auto;line-height: 35px;" >

		<div class="layui-form-item" style="width: 300px" lay-filter="selectTest">
		    <label class="layui-form-label" style="font-weight: bold;">题目类型：</label>
		    <div class="layui-input-block">
		      <select name="sort" lay-filter="aihao" lay-verify="required" disabled>	     
		      		  <option value=''>	${qp.questionType }  </option>  
		      </select>
		    </div>
		</div>
		
		
		
		<div class="layui-form-item" style="width: 300px" lay-filter="selectTest">
		    <label class="layui-form-label" style="font-weight: bold;">题目类型：</label>
		    <div class="layui-input-block">
		      <select name="sort" lay-filter="aihao" lay-verify="required" disabled>	     
		      		  <option value=''>	${qp.lei}  </option>  
		      </select>
		    </div>
		</div>
		

		
		<div class="layui-form-item" style="">
			<label class=" layui-form-label "  style="font-weight: bold;">题目标题：</label>
			<div class="layui-input-block" style="border: 0px solid black; ">
				<input type="text" name="value" lay-verify="title"
					autocomplete="off" placeholder="请设置路径" disabled="disabled"  value="	${qp.questionTitle} " class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label" style="font-weight: bold;">选项：</label>
			<c:forEach items="${qp.data }" var="i" begin="0" end="${qp.data.size() }">
					<div class="layui-input-block">
						<input type="text" name="value" lay-verify="title"
					autocomplete="off" placeholder="请设置路径" disabled="disabled"  value="	${i.answerSelect }、${i.answerContent}" class="layui-input">
					</div>
			</c:forEach>
		</div>
	
		
		

		
		<div class="layui-form-item" style="width: 400px">
			<label class=" layui-form-label "  style="font-weight: bold;">正确答案：</label>
			<div class="layui-input-block" style="border: 0px solid black; ">
			
				<input type="text" name="value" lay-verify="title"
					autocomplete="off" placeholder="请设置路径" disabled="disabled"  value="${qp.questionCorrect} " class="layui-input">
				
					
			</div>
		</div>

		
		
		<div class="layui-form-item"   style="width: 590px">
			<label class="layui-form-label"    style="font-weight: bold;">题目解析：</label>
			<div class="layui-input-block layui-input" style="height: 500px" >
				${qp.questionAnalysi}
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