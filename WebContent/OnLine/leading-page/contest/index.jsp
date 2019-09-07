<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8" />
    <title>ZNSD在线考试系统</title>
    <!-- 试卷列表 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/OnLine/css/app.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/OnLine/css/contest/index.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/lib/layui/css/layui.css" />
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery.countdown/2.2.0/jquery.countdown.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/app.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/contest/index.js"></script>
</head>
<body>
<div class="ui fixed inverted menu">

    <a href="../home.html" class="header item">
        <!--<img class="ui" src="@{/img/logo_flat.png}" width="104" height="24" alt="" />-->
        <img class="ui" src="${pageContext.request.contextPath}/OnLine/img/logo.png" width="156" height="32" alt="" />
    </a>
    <a  href="#" class="active item">
        <i class="desktop icon"></i>在线考试
    </a>
    <a href="../problem/problemset.html" class="item">
        <i class="list layout icon"></i>题库中心
    </a>
    <a  href="../my-homePage/myExam.html" class="item">
        <i class="talk icon"></i>考试记录
    </a>
    <!--<a onclick="'app.showLogin()'"  class="right item" if="${current_account == null}">
        <i class="sign in icon"></i>登录
    </a>-->
    <div class="ui simple dropdown right item" if="${current_account != null}">
        <img class="ui avatar image" src="${pageContext.request.contextPath}/OnLine/img/蜡笔小新.png" />
        <span text="${current_account.name}"></span> <i class="dropdown icon"></i>
        <div class="menu">
            <a class="item" href="../my-homePage/profile.html">
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
        <a class="section" href="../home.html"><i class="home icon"></i>首页</a>
        <i class="right chevron icon divider"></i>
        <div class="active section">在线考试</div>
    </div>
</div>
<!-- 倒计时时钟 -->
<!-- <div class="ui countdownTime container">
    <div class="red ui tiny horizontal statistic">
        <div class="value">
            <i class="wait icon"></i>
            <span id="contest-time-countdown"></span>
        </div>
    </div>
</div>
 -->
<div class="ui contestList container">
	
    <table class="ui table">
        <thead><tr>
            <th class="eight wide" style="width: 400px">考试标题</th>
            <th class="second wide">编号</th>
            <th class="second wide">开考时间</th>
            <th class="second wide">下考时间</th>
            <th class="second wide">所属班级</th>
            <th class="second wide">总分数</th>
            <th class="second wide">创建者</th>
            <th class="second wide">操作</th>
        </tr></thead>
        <tbody>
        <c:forEach items="${page.resultList}" var="task">
        	<tr >
	            <td>
	            	<!-- 三个考试状态 -->
	                <c:if test="${task.currentType == 1 }">
	                	<span class="ui yellow ribbon label">未开始</span>
	                </c:if>
	                <c:if test="${task.currentType == 2 }">
	                	<span class="ui green ribbon label">进行中</span>
	                </c:if>
	                <c:if test="${task.currentType == 3 }">
	                	<span class="ui red ribbon label">已结束</span>
	                </c:if>
	                <span class="ui header" >
	                    ${task.examPaperTitle}
	                </span>
	            </td>
	            <td><span >${task.id}</span></td>
	            <td>
	            	<span>
			            <c:if test="${task.startTime!=null}">
			            	<fmt:formatDate value="${task.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
			            </c:if>
	            	</span>
	            </td>
	            <td>
	            	<span>
			            <c:if test="${task.endTime!=null}">
			            	<fmt:formatDate value="${task.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
			            </c:if>
					</span>
				</td>
	            <td><span >${task.clazzName}</span></td>
	            <td><span >${task.examPaperTotalScroe}</span></td>
	            <td><span >${task.username}</span></td>
	            <td>

	            	<!-- swich开关判断当前session用户 -->
	            	<!-- 浅绿色灰-->
	            	<c:if test="${task.currentType == 1}">
		                <a href="#" class="small disabled grey ui button">进入考试</a>
	            	</c:if>
	            	<c:if test="${task.currentType == 2}">
	            		<!-- onclick="showLogin()"  -->
	            		<%-- <c:if test="${preCurrentUser ==null}">
			                <a href="javascript:void(0)"  class="small positive ui button">进入考试</a>
	            		</c:if>
	            		
	            		<c:if test="${preCurrentUser !=null}"> 
	            		</c:if> 
	            		--%>
			                <a href="javascript:void(0)" onclick="innerExamAction('${task.id}')"  class="small positive ui button">进入考试</a>
	            		
	            	</c:if>
	            	<c:if test="${task.currentType == 3}">
		                <a href="#" class="small disabled grey ui button">进入考试</a>
	            	</c:if>
	            </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- 分页 -->
<div class="ui subPage container">
	
    <div class="ui pagination menu" id="subPageMenu">
        <a class="item" onclick="taskList(1)">
            首页
        </a>
        <a class="item" onclick="taskList(${page.currentPage == 1 ? 1 : page.currentPage -1 })" >
            上一页
        </a>
        <c:forEach step="1" var="index" begin="1" end="${page.totalPage}" >
        	<a class="${page.currentPage == index ? 'active item' : 'item'}" onclick="taskList(${index})">
	            ${index}
	        </a>	
        </c:forEach>
        <a class="item" onclick= "taskList(${page.currentPage == page.totalPage ? page.totalPage : page.currentPage + 1})" >
            下一页
        </a>
        <a class="item" onclick= "taskList(${page.totalPage})" >
            末页
        </a>
    </div>
</div>
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
            <div class="ui button" id="loginModalCloseButton" onclick="closeLogin()">关闭</div>
            <div class="ui primary button" id="loginModalSubmitButton">登录</div>
        </form>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.js"></script>
<script type="text/javascript">
	// 进入考场
	function innerExamAction(taskId){
		$.ajax({
				url:'${pageContext.request.contextPath}/online/exam/'+taskId,
				type:'GET',
				success:function(result){
					if(result.status!=1){
						layui.use(['layer'],function(){
							var layer = layui.layer;
							layer.alert(result.msg);
						})
					}else{
						location.href="${pageContext.request.contextPath}/online/exams/"+result.data;
					}
				}})
	}
	// 分页
	function taskList(currentPage){
		location.href="${pageContext.request.contextPath}/online/task/list?currentPage="+currentPage;
	}
	// 显示登录窗口
	function showLogin(){
		$('#loginModal').modal({
            closable  : true,
            blurring: true,
        }).modal('show');
	}
	// 关闭登录窗口
	$(function(){
		$('#loginModalCloseButton').click(function (e) {
	           $('#loginModal').modal('hide');
	    });
	})
</script>
</body>
</html>