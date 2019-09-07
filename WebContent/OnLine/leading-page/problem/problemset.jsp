<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8" />
    <title>GDUFE在线考试系统</title>
    <!-- 题库中心，列表页面 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/OnLine/css/app.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/OnLine/css/problem/problemset.css" />
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/OnLine/js/problem/problemset.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/OnLine/layui/css/layui.css"  media="all">
</head>
<body>
<div class="ui fixed inverted menu">
    <a href="${pageContext.request.contextPath }/OnLine/home.html" class="header item">
        <!--<img class="ui" src="@{/img/logo_flat.png}" width="104" height="24" alt="" />-->
        <img class="ui" src="${pageContext.request.contextPath }/OnLine/img/logo.png" width="156" height="32" alt="" />
    </a>
    <a href="${pageContext.request.contextPath }/OnLine/contest/index.html" href="#" class="item">
        <i class="desktop icon"></i>在线考试
    </a>
    <a href="javascript:void(0)" class="active item">
        <i class="list layout icon"></i>题库中心
    </a>
     <a  href="${pageContext.request.contextPath }/OnLine/my-homePage/myExam.html" class="item">
        <i class="talk icon"></i>考试记录
    </a>
    <!--<a onclick="'app.showLogin()'" class="right item" if="${current_account == null}">
        <i class="sign in icon"></i>登录
    </a>-->
    <div class="ui simple dropdown right item"  >
        <img class="ui avatar image"  src="${pageContext.request.contextPath }/OnLine/img/${preCurrentUser.headPortrait}" />
        <span  text="${current_account.name}"></span> <i class="dropdown icon"></i>
        <div class="menu">
            <a class="item"  href="my-homePage/profile.html">
                <i class="user icon"></i>我的主页
            </a>
            <a class="item" id="logout">
                <i class="sign out icon"></i>退出
            </a>
        </div>
    </div>
</div>
<div class="ui header container">
    <div class="ui large breadcrumb">
        <a class="section" href="${pageContext.request.contextPath }/OnLine/home.html"><i class="home icon"></i>首页</a>
        <i class="right chevron icon divider"></i>
        <div class="active section">题库中心</div>
    </div>
</div>

<div class="ui problemSet container">
    <div class="ui secondary pointing menu">
        <a class="active item"><i class="book icon"></i>所有课程</a>
    </div>
    <!-- 第一排 -->
    <div class="ui four column stackable grid" id="problemsetTable"></div>
    
</div>
	<!-- 分页 -->
	<div class="ui subPage container">
		<div id="demo3"></div>
	</div>
	<script src="${pageContext.request.contextPath }/OnLine/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
	layui.use(['laypage', 'layer'], function(){
		var laypage = layui.laypage
		,layer = layui.layer;
		
		$.get("${pageContext.request.contextPath }/problemsetCount", function(data){
		
			laypage.render({
			   elem: 'demo3'
			   ,count: data
			   ,limit: 1
			   ,first: '首页'
			   ,last: '尾页'
			   ,prev: '<em>←</em>'
			   ,next: '<em>→</em>'
			   ,jump: function(obj, first){
					    //obj包含了当前分页的所有参数，比如：
					    //console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
					    //console.log(obj.limit); //得到每页显示的条数
					    $.ajax({
					    	type: "GET",
					    	url: "${pageContext.request.contextPath }/problemsetList",
					    	data: {
					    		page:obj.curr,
					    		limit:obj.limit
					    	},
					    	success: function(result){
					    		$("#problemsetTable").empty();
					    		for (var i = 0; i < result.length; i++) {
					    			var category = result[i];
									$("#problemsetTable").append('<div class="column" ><div class="ui fluid card"><a href="problemlist?id='+category.id+'" class="image"><img src="${pageContext.request.contextPath }/OnLine/img/'+category.categoryPicture+'" style="max-height: 155px;" /></a><div class="content"><div class="header"><a if="${current_account != null}" href="problemlist?id='+category.id+'" text="${item.name}">'+category.categoryName+'</a></div><p class="meta"><i class="user icon"></i><a href="javascript:void(0)">'+category.createPerson+'</a></p><p class="description"></p></div><div class="extra content"><span class="right floated"><span><i class="globe icon"></i>公共题库</span></span><i class="file text outline icon"></i><span text="${item.questionNum}"></span></div></div></div>')
								}
					    	}
					    	
					    })
					    //首次不执行
					  }
			});
		});
	});
	</script>
<!-- 不可抗力元素 -->
<div class="second-footer">
</div>
<div id="footer">
    <div class="ui container">
        <div class="ui stackable two columns grid">
            <div class="column">
                <div class="ui two columns grid">
                    <div class="column">
                        <h3>项目介绍</h3>
                        在线考试系统是一个在线测试学习系统，并用于辅助课程教学和学生学习。
                    </div>
                    <div class="column">
                        <h3>联系我们</h3>
                        如有问题请发邮件到
                        zzqnxx@foxmail.com
                    </div>
                </div>
            </div>
            <div class="right aligned column">
                &copy; 2018 GDUFE All Rights Reserved &nbsp;&nbsp;
                <br />
                网站版本：<a href="#">v1.0.0 Beta #20180109</a>&nbsp;&nbsp;
                服务器时间：<span id="current_server_timer"></span>
                <br />
                站长统计 | 今日IP[91] | 今日PV[4511] | 昨日IP[133] | 昨日PV[10109] | 当前在线[1]
                <!--
                TODO::pv,uv统计
                <span id='cnzz_stat_icon_1261763113'></span>
                <script src='@{//s95.cnzz.com/stat.php?id=1261763113&amp;online=1&amp;show=line}' type='text/javascript'></script>
                -->
            </div>
        </div>
    </div>
</div>

<!-- 登录模态框 -->
<div class="ui mini modal" id="loginModal">
    <div class="header">登录</div>
    <div class="content">
        <form class="ui form" id="loginModalForm">
            <div class="ui hidden negative message" id="loginModalErrorMessage">
                <!--
                <div class="header">错误提示</div>
                <p></p>
                -->
            </div>
            <div class="field required">
                <label>账号</label>
                <div class="ui left icon input">
                    <input id="username" type="text" placeholder="请输入学号或教工号或指定账号" />
                    <i class="user icon"></i>
                </div>
            </div>
            <div class="field required">
                <label>密码</label>
                <div class="ui left icon input">
                    <input id="password" type="password" />
                    <i class="lock icon"></i>
                </div>
            </div>
            <div class="field">
                <div class="ui toggle checkbox">
                    <input type="checkbox" id="rememberMe" name="rememberMe" tabindex="0" class="hidden" />
                    <label>记住登录</label>
                </div>
            </div>
            <div class="ui button" id="loginModalCloseButton">关闭</div>
            <div class="ui primary button" id="loginModalSubmitButton">登录</div>
        </form>
    </div>
</div>
</body>
</html>