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
    <link rel="stylesheet" href="../../static/css/font.css">
	<link rel="stylesheet" href="../../static/css/weadmin.css">
  </head>
  
  <body>
    <div class="weadmin-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="we-red">*</span>班级名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="we-red">*</span>
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="we-red">*</span>教师Id
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="1" id="userId" name="userId" required=""
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <div class="layui-form">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">创建时间</label>
						<div class="layui-input-inline">
							<input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
						</div>
					</div>
				</div>
			  </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label"></label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">增加</button>
          </div>
      </form>
    </div>
	<script src="../../lib/layui/layui.js" charset="utf-8"></script>
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
					admin: '{/}../../static/js/admin'
				});
        layui.use(['form','layer','admin'], function(){
          var form = layui.form,
          	admin = layui.admin,
          	layer = layui.layer;
          	form.render();
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            },
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          });
        });
    </script>
  </body>

</html>