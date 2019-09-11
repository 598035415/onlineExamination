<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>common</title>
</head>

<!-- 公共的头部  -->
<body>
<div class="ui fixed inverted menu">
	<a  href="${pageContext.request.contextPath}/online/home" class="header item" style="letter-spacing: 1px;">
        <!--<img class="ui"  src=" /img/logo_flat.png}" width="104" height="24" alt="" />-->
        <img class="ui"  src="${pageContext.request.contextPath }/OnLine/img/logo.png" width="156" height="32" alt="ZNSD" />
    </a>
    <a  href="${pageContext.request.contextPath}/online/task/list" class="item" style="letter-spacing: 1px;">
        <i class="desktop icon"></i>在线考试
    </a>
	<a  href="${pageContext.request.contextPath}/simu/simex/select" class="item" style="letter-spacing: 1px;">
        <i class="talk icon"></i>模拟练习
    </a>
    <a  href="${pageContext.request.contextPath }/problemset" class="item" style="letter-spacing: 1px;">
        <i class="list layout icon"></i>题库中心
    </a>
    <a  href="${pageContext.request.contextPath}/person/exam/rows" class="item" style="letter-spacing: 1px;">
        <i class="talk icon"></i>考试记录
    </a>
	<!--  右侧登录按钮。 -->
  	<c:choose>
   		<c:when test="${preCurrentUser != null }">
		    <div class="ui simple dropdown right item"  >
		        <img class="ui avatar image"  src="${pageContext.request.contextPath }/OnLine/img/${preCurrentUser.headPortrait}" />
		        <span  text="${current_account.name}"></span> <i class="dropdown icon"></i>
		        <div class="menu">
		            <a class="item"  href="${pageContext.request.contextPath }/profile" style="letter-spacing: 1px;">
		                <i class="user icon"></i>我的主页
		            </a>
		            <a class="item" id="logout" style="letter-spacing: 1px;">
		                <i class="sign out icon"></i>退出
		            </a>
		        </div>
		    </div> 
   		</c:when>
   		
   		<c:otherwise>
        	<a  onclick="innerLogin()" id="loginY"  class="right item"  >
        		<i class="sign in icon"></i>登录
    		</a>
    	</c:otherwise>
   </c:choose>
   
</div>
   
   
<!-- 登录模态框 -->
<div class="ui mini modal" id="loginModal">
    <div class="header">登录</div>
    <div class="content">
        <form class="ui form" id="loginModalForm">
            <div class="ui hidden negative message" id="loginModalErrorMessage">
                <div class="header">错误提示</div>
            </div>
            <div class="field required">
                <label>账号</label>
                <div class="ui left icon input">
                    <input id="username" type="text" placeholder="输入用户名" />
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


<!-- 初始化模态框 -->
<script type="text/javascript">
    $(function(){
        app.init("${pageContext.request.contextPath}");
    });
    // 进入登录页面
    function innerLogin(){
    	$('#loginModal').modal({
            closable  : false,
            blurring: true,
        }).modal('show');
    } 
</script>    
</body>
</html>