<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/lib/layui/css/layui.css"  media="all">
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-body">
	<form class="layui-form layui-form-pane" action="">
	  <div class="layui-form-item" pane="">
	    <label class="layui-form-label">选择类型</label>
	    <div class="layui-input-block">
	    	<c:forEach var="type" items="${typeList}">
	    		<input type="radio" name="questionType" value="${type.id}" title="${type.label}">
	    	</c:forEach>
	      <!-- <input type="radio" name="questionType" value="禁" title="禁用" disabled=""> -->
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">题目内容</label>
	    <div class="layui-input-block">
	      <input type="text" name="title" autocomplete="off" placeholder="请输入题目内容" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">单行选择框</label>
	    <div class="layui-input-block">
	      <select name="interest" lay-filter="aihao">
	        <option value=""></option>
	        <option value="0">写作</option>
	        <option value="1" selected="">阅读</option>
	        <option value="2">游戏</option>
	        <option value="3">音乐</option>
	        <option value="4">旅行</option>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">文本域</label>
	    <div class="layui-input-block">
	      <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <button class="layui-btn" lay-submit="" lay-filter="demo2">跳转式提交</button>
	  </div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.extend({
        admin: '{/}${pageContext.request.contextPath}/WeAdmin/static/js/admin'
    });
    layui.use(['form','layer','jquery'], function(){
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;
        form.render();
        //自定义验证规则
        form.verify({
            nikename: function(value){
                if(value.length < 5){
                    return '昵称至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
        });
        //监听提交
        form.on('submit(demo1)', function(data){
          layer.alert(JSON.stringify(data.field), {
            title: '最终的提交信息'
          })
          return false;
        });
    });
</script>
</body>

</html>
