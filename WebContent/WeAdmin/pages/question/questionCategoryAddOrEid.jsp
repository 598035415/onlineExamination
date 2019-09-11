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



	<form class="layui-form"  style="width: 700px;margin: 0px auto;margin-top: 100px" >
		<div class="layui-form-item"  style="display: none;">
			<div class="layui-input-block">
				<input type="hidden" name="id" 
					autocomplete="off" placeholder="题目类别id"  value="${qc.id}" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item"  style="display: none;">
			<div class="layui-input-block">
				<input type="hidden" name="categoryPicture" 
					autocomplete="off" placeholder="图片名称"  value="${qc.categoryPicture}" class="layui-input">
			</div>
		</div>
		
		
		
		<div class="layui-form-item">
			<label class="layui-form-label">类别名称</label>
			<div class="layui-input-block">
				<input type="text" name="categoryName" lay-verify="title"
					autocomplete="off" placeholder="请输入题目类别名称"  value="${qc.categoryName}" class="layui-input">
			</div>
		</div>
		
		
	   <div class="layui-form-item" style="width: 400px" lay-filter="selectTest">
		    <label class="layui-form-label">选择父节点</label>
		    <div class="layui-input-block">
		      <select name="parentId" lay-filter="aihao" lay-verify="required">	     
		      		 <!-- ajax 自动 加载  -->  
		      </select>
		    </div>
		</div>
		
		
		<div class="layui-form-item" style="width: 400px" lay-filter="selectTest">
		    <label class="layui-form-label">选择图片</label>
		    <div class="layui-input-block">
		     	 <button type="button"    class="layui-btn" id="test1">
					  <i   class="layui-icon">&#xe67c;</i>上传图片
				</button>
		    </div>
		</div>
		
		<div class="layui-form-item" style="width: 400px" lay-filter="selectTest">
		    <label class="layui-form-label">图片预览</label>
		    <div class="layui-input-block">
		    
		     	<img alt=""  width="500px" height="300px"  id="qcImg" src="OnLine/img/${qc.categoryPicture}">
		     	
		    </div>
		</div>
			

			
			
			
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="button" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>


	<script>
		layui.use([ 'form', 'layedit', 'laydate','upload' ],function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
							
							// 文件上传
							 var upload = layui.upload;
							 //文件上传 回调
							  var uploadInst = upload.render({
							    elem: '#test1' //绑定元素
							    ,url: '${pageContext.request.contextPath }/qcHead' //上传接口
							    ,done: function(res){
							      //上传完毕回调
							     
							      if( res.code=='0' ){
							    	  layer.msg( "上传成功" );
							    	  $('input[name=categoryPicture]').val(res.msg);
							    	
							    	  $('#qcImg').attr('src',"${pageContext.request.contextPath }/OnLine/img/"+res.msg);
							      }else{
							    	  layer.msg(  res.msg  );
							      }
							      
							      
							      
							    }
							    ,error: function(){
							      //请求异常回调
							      layer.msg("上传异常  请联系管理员");
							    }
							  });
							 
							
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
										return '内容至少得2个字符啊';
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
												url:"${pageContext.request.contextPath }/qcCU",
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
							
							
							
							// 渲染  节点块
							$.ajax(
									{
										url:"${pageContext.request.contextPath }/qcParent",
										type:"post",
										dataType:"json",
										success:function(result){
											
											var list = result.data;
											var str=  "${qc.parentId}";
											var sele= $("select[lay-filter=aihao]");
											
											
											sele.append("   <option value='0'>不选择父节点</option>  ");
											for (var i = 0; i < list.length; i++) {
												if( list[i].id==str ){
													sele.append("   <option  value='"+list[i].id+"'  selected=''>"+list[i].categoryName+"</option>  ");
												}else{
													sele.append("   <option value='"+list[i].id+"'>"+list[i].categoryName+"</option>  ");
												}
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
	</script>

</body>
</html>