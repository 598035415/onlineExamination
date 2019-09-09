<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8" />
    <title>GDUFE在线考试系统</title>
    <!-- 个人信息 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
    <link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css" />
    <!-- TODO::文件上传 -->
    <!--<link rel="stylesheet" href="@{https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css}" />-->
    <!--<link rel="stylesheet" href="@{https://cdn.bootcss.com/bootstrap-fileinput/4.4.6/css/fileinput.min.css}" />-->

    <link rel="stylesheet" href="${pageContext.request.contextPath }/OnLine/css/app.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/OnLine/css/user/profile.css" />
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
    <!-- TODO::bootstrapInput文件上传 -->
    <!--<script type="text/javascript" src="@{https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js}"></script>-->
    <!--<script type="text/javascript" src="@{https://cdn.bootcss.com/bootstrap-fileinput/4.4.6/js/fileinput.min.js}"></script>-->
    <!--<script type="text/javascript" src="@{https://cdn.bootcss.com/bootstrap-fileinput/4.4.6/js/locales/zh.min.js}"></script>-->

    <script type="text/javascript" src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/OnLine/js/user/profile.js"></script>
</head>
<body>
<div class="ui fixed inverted menu">
    <a href="${pageContext.request.contextPath }/OnLine/home.html" class="header item">
        <!--<img class="ui" src="@{/img/logo_flat.png}" width="104" height="24" alt="" />-->
        <img class="ui" src="${pageContext.request.contextPath }/OnLine/img/logo.png" width="156" height="32" alt="" />
    </a>
    <a href="../contest/index.html" href="#" class="item">
        <i class="desktop icon"></i>在线考试
    </a>
    <a href="../problem/problemset.html" class="item">
        <i class="list layout icon"></i>题库中心
    </a>
     <a  href="../my-homePage/myExam.html" class="item">
        <i class="talk icon"></i>考试记录
    </a>
    <a id="logout" class="right item">
        <i class="sign out icon"></i>退出
    </a>
</div>

<div class="ui main container">
    <div class="ui grid">
        <div class="four wide column">
            <div class="row">
                <div class="ui card">
                    <div class="blurring dimmable image">
                        <div class="ui dimmer">
                            <div class="content">
                                <div class="center">
                                    <!--<div class="ui inverted button">Call to Action</div>-->
                                    <!-- TODO::上传图片 -->
                                    <a href="@{/account/profile}" data-inverted="" data-tooltip="更换头像" data-position="bottom center"><i class="huge photo icon"></i></a>
                                </div>
                            </div>
                        </div>
                        <!--<img src="@{'/upload/images/'+${current_account.avatarImgUrl}}" />-->
                    </div>
                    <div class="content">
                        <div class="header" text="${current_account.name}"></div>
                        <div class="meta">
                            <!--<a class="group">信息学院</a>-->
                            <div class="group">
                                <i class="student icon"></i>信息学院
                            </div>
                        </div>
                        <div class="description" text="${current_account.description}"></div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 1em;">
                <div class="ui card">
                    <div class="content">
                        <a href="javascript:void(0)">
                            <i class="user icon"></i>个人信息
                        </a>
                        <i class="pointing left icon"></i>
                    </div>
                    <div class="content">
                        <a href="password.html">
                            <i class="edit icon"></i>更改密码
                        </a>
                    </div>
                    <div class="content">
                        <a href="myExam.html">
                            <i class="history icon"></i>考试记录
                        </a>
                    </div>
                    <!--<div class="content">
                        <a href="@{/account/myDiscussPost}">
                            <i class="talk icon"></i>我的发帖
                        </a>
                    </div>-->
                </div>
            </div>
        </div>
        <div class="twelve wide column">
            <div class="ui segment">
                <h4 class="ui dividing header">基本信息</h4>
                <form class="ui form attached fluid segment" id="updateAccountForm">
                    <div class="ui hidden negative message" id="updateAccountErrorMessage">
                        <!--
                        <div class="header">错误提示</div>
                        <p></p>
                        -->
                    </div>
                    <div class="field">
                        <label><i class="user icon"></i>姓名</label>
                        <input id="myName" name="myName" readonly="" placeholder="请输入姓名"
                               type="text" value="${current_account.name}" />
                    </div>
                    <div class="field">
                        <label><i class="student icon"></i>学号</label>
                        <input id="myUsername" name="myUsername" readonly="" placeholder="请输入学号"
                               type="text" value="${current_account.username}" />
                    </div>
                    <div class="field">
                        <label><i class="qq icon"></i>QQ</label>
                        <input id="myQq" name="myQq" placeholder="请输入QQ" type="text"
                               value="${current_account.qq}" />
                    </div>
                    <div class="field">
                        <label><i class="mobile icon"></i>手机号码</label>
                        <input id="myPhone" name="myPhone" placeholder="请输入手机号码" type="text"
                               value="${current_account.phone}" />
                    </div>
                    <div class="field">
                        <label><i class="mail outline icon"></i>邮箱</label>
                        <input id="myEmail" name="myEmail" placeholder="请输入邮箱地址" type="text"
                               value="${current_account.email}" />
                    </div>
                    <div class="field">
                        <label><i class="upload icon"></i>上传头像</label>
                        <div class="ui three column grid">
                            <div class="column">
                                <div class="ui fluid card">
                                    <div class="image">
                                        <img id="avatarImgPreview" class="ui tiny image" src="@{'/upload/images/'+${current_account.avatarImgUrl}}" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="file" id="myfile" name="myfile" value="" onchange="profilePage.uploadAvatar()"/>
                        <input type="hidden" id="myAvatarImgUrl" name="myAvatarImgUrl" value="" />
                    </div>
                    <div class="field">
                        <label><i class="smile icon"></i>自我描述</label>
                        <textarea  id="myDescription" name="myDescription" rows="6"
                                   text="${current_account.description}"></textarea>
                    </div>
                    <div class="ui primary button" id="updateAccountButton">保存</div>
                </form>
            </div>
        </div>
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
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //var contextPath = ;

    /*$(function(){
        app.init(contextPath);
        profilePage.init();
    });*/
</script>
</body>
</html>