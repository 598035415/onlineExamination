<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>添加管理员-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css">
  </head>
  
  <body>
    <div class="weadmin-body">
        <form class="layui-form" action="javascript:vodi(0)" onsubmit="return false">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="we-red">*</span>班级名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="clazzName" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="we-red">*</span>
              </div>
          </div>
          <div class="layui-form-item">
		    <label class="layui-form-label">选择教师</label>
		    <div class="layui-input-block" style="width: 200px;">
		      <select name="userId" lay-filter="" id="userId" lay-verify="examId">
		    	<option value="0">请选择</option>
		     	<c:forEach items="${teacherSelectList}" var="List">
		     		<option value="${List.id }">${List.username}</option>
		     	</c:forEach>
		      </select>
		    </div>
		  </div>
<!--           <div class="layui-form-item">
              <div class="layui-form">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">创建时间</label>
						<div class="layui-input-inline">
							<input type="text" name="createTimes" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
						</div>
					</div>
				</div>
			  </div>
          </div> -->
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label"></label>
              <button  class="layui-btn" id="clazzSave" lay-filter="add" >增加</button>
          </div>
      </form>
    </div>
	<script src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;
			//常规用法
			laydate.render({
				elem: '#test1'
			});
		});
	</script>
    <script type="text/javascript">
    	layui.extend({
			admin: '{/}${pageContext.request.contextPath}/WeAdmin/static/js/admin'
		});
        layui.use(['form','jquery','layer','admin'], function(){
          var form = layui.form,
          	admin = layui.admin,
          	layer = layui.layer;
          		 $= layui.jquery;
          	form.render();

          //监听提交
          $("#clazzSave").on("click",function(){
        	  if($("#userId").val()<=0){
        		  layer.msg("请选择教师", {icon:5,time:800});
        		  return;
        	  }
        	  $.ajax({
	    		  url:"${pageContext.request.contextPath}/clazzAdd",
	    		  data:$(".layui-form").serialize(),
	    		  dataType:"JSON",
	    		  success:function(result){
	    			  if(result.status===1){
	    				  layer.msg("增加成功", {icon: 6,time:800},function () {
	    		                // 获得frame索引
	    		                var index = parent.layer.getFrameIndex(window.name);
	    		                //关闭当前frame
	    		                parent.layer.close(index);
	    		                window.parent.location.reload();
	    		            });
	    			  }else{
	    				  layer.msg("增加失败", {icon:5});
	    			  }
	    		  }
    	  	  })
          })
          
        /*   form.on('submit(add)', function(data){
            //发异步，把数据提交给php
            return false;
          }); */
        });
    </script>
  </body>

</html>