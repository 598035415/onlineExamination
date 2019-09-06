<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>管理员登录-ZNSD Frame型后台管理系统-考试管理系统 1.0</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    
    <link rel="shortcut icon" href="WeAdmin/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="WeAdmin/static/css/font.css">
	<link rel="stylesheet" href="WeAdmin/static/css/weadmin.css">
    <script src="WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
</head>
<body class="login-bg">
    
    <div class="login">
        <div class="message">WeAdmin 1.0-管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" onsubmit="return false" >
            <input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input class="loginin" value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
            <div>
            	前端静态展示，请随意输入，即可登录。
            </div>
        </form>
    </div>

    <script type="text/javascript">
        
        	layui.extend({
				admin: '{/}./WeAdmin/static/js/admin'
			});  
            layui.use(['form','jquery','admin'], function(){
              var form = layui.form
              	,admin = layui.admin;
              form.on('submit(login)', function(data){
            	$ = layui.jquery;
            	var username = $("input[name=username]").val();
				var password = $("input[name=password]").val();
            	$.ajax({
            		url:'adminLogin',
					data:"username="+username+"&password="+password,
					type:"post",
	              	dataType:"json",
	              	success:function(data){
	              		console.info(data.msg);
	              		if(data.code=="200"){
	              			layer.msg(data.msg,function(){
	              				location.href = 'adminIndex';
	              			})
	              		}else{
	              			layer.msg(data.msg)
	              		}
	              	}
            	})
                return false;
              });
            });   
    </script>  
    <!-- 底部结束 -->
</body>
</html>