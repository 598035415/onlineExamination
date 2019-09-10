<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="we-red">*</span>班级Id
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${clazzId}" readonly="readonly" id="username" name="clazzId" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
     
          <div class="layui-form">
			  <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label">开始时间</label>
			      <div class="layui-input-inline">
			        <input type="text" name="startTimes" class="layui-input" readonly="readonly" id="test1" placeholder="yyyy-MM-dd HH:mm:ss">
			      </div>
			    </div>
			  </div>
		  </div>
		 <div class="layui-form">
		  <div class="layui-form-item">
		    <div class="layui-inline">
		    	<div class="layui-inline">
		      		<label class="layui-form-label">结束时间</label>
		      	<div class="layui-input-inline">
		        <input type="text" name="endTimes" class="layui-input" readonly="readonly" id="test2" placeholder="yyyy-MM-dd HH:mm:ss">
		      </div>
		    </div>
		  	</div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">选择试卷</label>
		    <div class="layui-input-block" style="width: 200px;">
		      <select name="examId" lay-filter="" id="exam" lay-verify="examId">
		    	<option value="0">请选择</option>
		        <c:forEach items="${examPaperList}" var="paperList">
		        	<option value="${paperList.id }">${paperList.examPaperTitle}</option>
		        </c:forEach>
		      </select>
		    </div>
		  </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="we-red">*</span>发布者
              </label>
              <div class="layui-input-inline">
                  <input type="text" readonly="readonly" value="1" id="L_repass" name="publishPerson" required="" lay-verify="repass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label"></label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">增加</button>
          </div>
      </form>
    </div>
	<script src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
	layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  //常规用法
		  laydate.render({
		    elem: '#test1'
		    ,type: 'datetime'
		  });
		  laydate.render({
			elem: '#test2'
			,type: 'datetime'
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
      	$=layui.jquery;
      	form.render();
    
      //监听提交
      form.on('submit(add)', function(data){
    	if($("#test1").val()>$("#test2").val()){
    		layer.msg("开始时间不能大于结束时间", {icon: 5,time:1000});
    		return ;
    	}
    	if($("#exam").val()<=0){
    		layer.msg("请选择试卷", {icon: 5,time:1000});
    		return ;
    	}
         $.ajax({
        	 url:"${pageContext.request.contextPath}/missionAdd",
        	 data:$(".layui-form").serialize(),
        	 type:"post",
        	 dataType:"JSON",
        	 success:function(result){
        		 console.info(result)
        		 if(result.status===745){
        			 layer.msg(result.msg, {icon: 5,time:1000});
        			 return;
        		 }
        		 if(result.status===1){
		            layer.msg("增加成功", {icon: 6,time:1000},function () {
		                // 获得frame索引
		                var index = parent.layer.getFrameIndex(window.name);
		                //关闭当前frame
		                parent.layer.close(index);
		                window.parent.location.reload()
		            });
        		 }else{
        			 layer.msg("增加失败", {icon: 5,time:1000});
        		 }
        	 }
         })
        //发异步，把数据提交给php
        return false;
      });
    });
    </script>
  </body>

</html>