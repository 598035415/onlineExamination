 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8" />
    <title>模拟练习</title>
    <!-- 试卷列表 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/OnLine/css/app.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/OnLine/css/contest/index.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/OnLine/css/exam_info.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/OnLine/css/ion.checkRadio.cloudy.css" />
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/WeAdmin/lib//layui/css/layui.css"/>
    <!-- 引入layui -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
    
    
</head>
<body>
<div class="ui fixed inverted menu">
	
    <a href="../home.html" class="header item">
        <img class="ui" src="#" width="156" height="32" alt="" />
    </a>
    <a  href="index.html" class="active item">
        <i class="desktop icon"></i><h5 style="letter-spacing: 1px;">在线考试</h5>
    </a>
    <a href="../problem/problemset.html" class="item">
        <i class="list layout icon"></i><h5 style="letter-spacing: 1px;">题库中心</h5>
    </a>
    <a  href="../my-homePage/myExam.html" class="item">
        <i class="talk icon"></i><h5 style="letter-spacing: 1px;">模拟练习</h5>
    </a>
    <div class="ui simple dropdown right item" if="${current_account != null}">
        <img class="ui avatar image" src="../../img/蜡笔小新.png" />
        <span text="${current_account.name}"></span> <i class="dropdown icon"></i>
        <div class="menu">
            <a class="item" href="../my-homePage/profile.html">
                <i class="user icon"></i><h5 style="letter-spacing: 1px;">我的主页</h5>
            </a>
            <a class="item" id="logout">
                <i class="sign out icon"></i><h5 style="letter-spacing: 1px;">退出</h5>
            </a>
        </div>
    </div>
</div>
<div class="ui header container">
    <div class="ui large breadcrumb">
        <a class="section" href="../home.html"><i class="home icon"></i>首页</a>
        <i class="right chevron icon divider"></i>
        <div class="active section">模拟练习</div>
    </div>
</div>

<div class="ui contestList container">
   <div class="result-subject-item" style="height: 70px;">
		<h1><b>模拟练习</b></h1>
			<!-- <ul class="subject-num-list" id="ulTitle">
				<li class="correct-order">
					<a class="done-hover " href="https://www.nowcoder.com/profile/495320559/test/27154049/579632#summary" data-qid="579632">
					1
					</a>
				</li>
				<li class="error-order">
					<a class="" href="https://www.nowcoder.com/profile/495320559/test/27154049/579633#summary" data-qid="579633">
					2
				</a>
				</li>
			</ul> -->
		</div>
			<div class="result-question-box" style="height: 70px;">
			<div class="subject-question">
			<span class="question-number" id="number">々 </span>
			<div class="question-main" id="title">选择问题类型 ：</div>
			</div>
		</div>
	<!-- 题目类型树 -->
	<div class="result-subject-item result-subject-answer" >
	  <div id="test12" class="demo-tree-more"></div>
	</div>
   
   <div style="font-size:15px;">
   		<span >选择此次题目数量：</span>
   		 <span>
			<span class="js-demo-1">
				<label><input type="radio" name="questionCount" value="5" checked /> 5</label>
				<label><input type="radio" name="questionCount" value="15" />15</label>
				<label><input type="radio" name="questionCount" value="25" />25</label>
			</span>
   		 </span>
   </div>
   </br>
   <div style="margin-left: 15px;">
   	 <button type="button" class="layui-btn"  onclick="confimSelect()"><i class="layui-icon">&#xe642;</i>开始练习</button>
   </div>
   
</div>
<!-- 分页 -->
<div class="ui subPage container" >
    <div class="ui pagination menu" id="subPageMenu" >
        
        
    </div>
</div>
<!-- 不可抗力元素 -->
<div class="second-footer" >
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
                        1492957500@qq.com
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
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/ion.checkRadio.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/WeAdmin/lib//layui/layui.js"></script>
<script type="text/javascript">
	
	
	// 提交选择的题目
	function confimSelect(){
		// 选择的数量
		var count = $("input[name='questionCount']:checked").val();
		// 选择的值
		var checkeds = new Array();
		$("#test12 input[type='checkbox']:checked ").each(function(i){
			checkeds.push($(this).val());
		})
		location.href="${pageContext.request.contextPath}/simu/inner/test/page?checkeds="+checkeds.join()+"&count="+count;
	}
	

	layui.use(['tree', 'util'], function(){
	  var tree = layui.tree
	  ,layer = layui.layer
	  ,util = layui.util
	  $.ajax({url:"${pageContext.request.contextPath}/simu/simex/select/type",type:"GET",success:function(data){
		  tree.render({
			    elem: '#test12'
			    ,data: data
			    ,showCheckbox: true  
			    ,id: 'demoId1'
			  });
	  	}
	  })
	})
	
	
</script>


<script type="text/javascript">
$(".js-demo-1").find("input").ionCheckRadio();
</script>

</html>