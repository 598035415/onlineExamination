<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>GDUFE在线考试系统</title>
    <!-- 学生前台首页 -->
    <!--semantic.min.css -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/OnLine/css/app.css" />
    <link rel="stylesheet"  href=" ${pageContext.request.contextPath }/OnLine/css/home.css" />
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/jquery/semantic.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/jquery/jquery-cookie.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/home.js"></script>
</head>
<body>
   
<%@include file="/OnLine/common_head.jsp" %>

<div class="pg_page_container">
    <div id="main_background"  style="background-image: url(${pageContext.request.contextPath }/OnLine/img/bg.jpg);">
        <div class="logo_panel">
            <br/><br/><br/><br/><br/><br/>
            <!--<img  src=" /img/logo_flat.png}" style="max-height: 80px; height:80px;" /><br />-->
            <!--<span style="font-size: 1.2em; font-weight: 500; letter-spacing: 0.5em; line-height: 3.2em; color: #fff;">在线考试教学辅助系统1.0</span>-->
            <span style="font-size: 1.8em; font-weight: 500; letter-spacing: 0.5em; line-height: 3.2em; color: #fff;">ZNSD 在线考试系统 1.0 v</span>
            <br />
        </div>
    </div>
</div>
<div class="ui container">
    <div align="center" style="margin-bottom: 5rem;">
        <!--<h1>在线考试系统 2.0<br/><small>遇见更好的你</small></h1>-->
        <h1>功能特性</h1>
    </div>
    <div class="ui four columns stackable grid">
        <div class="column" align="center">
            <i class="list layout huge icon"></i><h4>题库</h4>
            <h5>适合教学使用的题目，合理的题目分类</h5>
        </div>
        <div class="column" align="center">
            <i class="desktop huge icon"></i><h4>考试</h4>
            <h5>即使是正规的教学考试，也能轻松应对，准确评判</h5>
        </div>
        <div class="column" align="center">
            <i class="users huge icon"></i><h4>社区</h4>
            <h5>在这里同学可以分享自己的学习体验，解答疑惑</h5>
        </div>
        <div class="column" align="center">
            <i class="github square huge icon"></i>
            <h4>技术</h4>
            <h5>多样化判题技术，灵活选择判题模式，准确的同时也能近人情</h5>
        </div>
    </div>
    <br /><br />
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
                <script  src=' //s95.cnzz.com/stat.php?id=1261763113&amp;online=1&amp;show=line}' type='text/javascript'></script>
                -->
            </div>
        </div>
    </div>
</div>
</body>
</html>