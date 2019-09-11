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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css">
  </head>
  <body>
    <div class="weadmin-body">
      <form class="layui-form">
      		<div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="we-red">*</span>学生名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${updateSelectList.username }" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_pass" class="layui-form-label">
                  <span class="we-red">*</span>密码
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${updateSelectList.password }" id="L_pass" name="password" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
           <div class="layui-form-item">
              <div class="layui-form">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">生日</label>
						<div class="layui-input-inline">
							<input type="text" value="${updateSelectList.birthdays}" name="birthdays" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
						</div>
					</div>
				</div>
			  </div>
          </div>
          <div class="layui-form-item">
			    <label class="layui-form-label">性别</label>
			    <div class="layui-input-block">
			      <input type="radio" name="gender" value="1" title="男" checked="">
			      <input type="radio" name="gender" value="2" title="女">
			    </div>
		  </div>
		 
          <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">
                  <span class="we-red">*</span>班级Id
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="L_email" value="${updateSelectList.clazzId}" name="clazzId" required="" lay-verify=""
                  autocomplete="off" class="layui-input">
              </div>
          </div>
        
          <div class="layui-form-item">
          	<input type="hidden" value="${updateSelectList.id}" name="id">
              <label for="L_repass" class="layui-form-label"></label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">确认修改</button>
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
          	$=layui.jquery;
          	form.render();
          //监听提交
          form.on('submit(add)', function(data){
        	 var sex=$('input:radio[name="sex"]:checked').val();
             $.ajax({
            	 url:"${pageContext.request.contextPath}/studentUpdate",
            	 data:$(".layui-form").serialize(),
            	 type:"post",
            	 dataType:"JSON",
            	 success:function(result){
            		 console.info(result)
            		 if(result.status===1){
			            layer.msg("修改成功", {icon: 6,time:800},function () {
			                // 获得frame索引
			                var index = parent.layer.getFrameIndex(window.name);
			                //关闭当前frame
			                parent.layer.close(index);
			                window.parent.location.reload()
			            });
            		 }else{
            			 layer.msg("修改失败", {icon: 5,time:800});
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