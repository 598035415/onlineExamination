<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8" />
    <title>GDUFE在线考试系统</title>
    <!-- 个人所有考试记录 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
    <link rel="stylesheet" href="../../css/app.css" />
    <link rel="stylesheet" href="../../css/user/myExam.css" />
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
    <script type="text/javascript" src="../../js/app.js"></script>
    <script type="text/javascript" src="../../js/user/myExam.js"></script>
</head>
<body>
<div class="ui fixed inverted menu">
    <a href="@{/}" class="header item">
        <!--<img class="ui" src="@{/img/logo_flat.png}" width="104" height="24" alt="" />-->
        <img class="ui" src="../../img/logo.png" width="156" height="32" alt="" />
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
                        <div class="header">曾庆熙</div>
                        <div class="meta">
                            <!--<a class="group">信息学院</a>-->
                            <div class="group">
                                <i class="student icon"></i>信息学院
                            </div>
                        </div>
                        <div class="description">某工地的程序员</div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 1em;">
                <div class="ui card">
                    <div class="content">
                        <a href="profile.html">
                            <i class="user icon"></i>个人信息
                        </a>
                    </div>
                    <div class="content">
                        <a href="password.html">
                            <i class="edit icon"></i>更改密码
                        </a>
                    </div>
                    <div class="content">
                        <a href="javascript:void(0)">
                            <i class="history icon"></i>考试记录
                        </a>
                        <i class="pointing left icon"></i>
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
                <h4 class="ui dividing header">考试记录</h4>
                <div class="ui three cards">
                    <div class="ui card paper" each="item,itemStats : ${data['grades']}">
                        <div class="content">
                            <div class="header paper-title" text="${item.contest.title}">顺丰2017校招研发工程师笔试试卷</div>
                        </div>
                        <div class="extra content paper-type" style="background-color: #9ED5C9;color: #FFFFFF;" text="${item.contest.subjectName}">
                            计算机网络
                        </div>
                        <div class="content">
                            <div class="ui small feed">
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="wait icon"></i>完成时间&nbsp;:&nbsp;</a><span class="paper-finish-time" text="${#dates.format(item.createTime, 'yyyy-MM-dd HH:mm:ss')}">2018-1-11 11:15:27</span></div>
                                    </div>
                                </div>
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="database icon"></i>得分&nbsp;:&nbsp;</a><span text="${item.result}">100</span></div>
                                    </div>
                                </div>
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="trophy icon"></i>排名&nbsp;:&nbsp;</a><span>--</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--
                    <div class="ui card paper">
                        <div class="content">
                            <div class="header paper-title">顺丰2017校招研发工程师笔试试卷</div>
                        </div>
                        <div class="extra content paper-type" style="background-color: #9ED5C9;color: #FFFFFF;">
                            计算机网络
                        </div>
                        <div class="content">
                            <div class="ui small feed">
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="wait icon"></i>完成时间&nbsp;:&nbsp;</a><span class="paper-finish-time">2018-1-11 11:15:27</span></div>
                                    </div>
                                </div>
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="database icon"></i>得分&nbsp;:&nbsp;</a><span>100</span></div>
                                    </div>
                                </div>
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="trophy icon"></i>排名&nbsp;:&nbsp;</a><span>100</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ui card paper">
                        <div class="content">
                            <div class="header paper-title">顺丰2017校招研发工程师笔试试卷</div>
                        </div>
                        <div class="extra content paper-type" style="background-color: #9ED5C9;color: #FFFFFF;">
                            计算机网络
                        </div>
                        <div class="content">
                            <div class="ui small feed">
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="wait icon"></i>完成时间&nbsp;:&nbsp;</a><span class="paper-finish-time">2018-1-11 11:15:27</span></div>
                                    </div>
                                </div>
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="database icon"></i>得分&nbsp;:&nbsp;</a><span>100</span></div>
                                    </div>
                                </div>
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="trophy icon"></i>排名&nbsp;:&nbsp;</a><span>100</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ui card paper">
                        <div class="content">
                            <div class="header paper-title">顺丰2017校招研发工程师笔试试卷</div>
                        </div>
                        <div class="extra content paper-type" style="background-color: #9ED5C9;color: #FFFFFF;">
                            计算机网络
                        </div>
                        <div class="content">
                            <div class="ui small feed">
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="wait icon"></i>完成时间&nbsp;:&nbsp;</a><span class="paper-finish-time">2018-1-11 11:15:27</span></div>
                                    </div>
                                </div>
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="database icon"></i>得分&nbsp;:&nbsp;</a><span>100</span></div>
                                    </div>
                                </div>
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="trophy icon"></i>排名&nbsp;:&nbsp;</a><span>100</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ui card paper">
                        <div class="content">
                            <div class="header paper-title">顺丰2017校招研发工程师笔试试卷</div>
                        </div>
                        <div class="extra content paper-type" style="background-color: #9ED5C9;color: #FFFFFF;">
                            计算机网络
                        </div>
                        <div class="content">
                            <div class="ui small feed">
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="wait icon"></i>完成时间&nbsp;:&nbsp;</a><span class="paper-finish-time">2018-1-11 11:15:27</span></div>
                                    </div>
                                </div>
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="database icon"></i>得分&nbsp;:&nbsp;</a><span>100</span></div>
                                    </div>
                                </div>
                                <div class="event">
                                    <div class="content">
                                        <div class="summary"><a><i class="trophy icon"></i>排名&nbsp;:&nbsp;</a><span>100</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    -->
                </div>
                <!-- 分页 -->
                <div class="ui container">
                    <div class="ui pagination menu" id="subPageMenu">
                        <!--
                        <a class="item">
                            首页
                        </a>
                        <a class="item">
                            上一页
                        </a>
                        <a class="active item">
                            1
                        </a>
                        <a class="item">
                            2
                        </a>
                        <a class="item">
                            3
                        </a>
                        <a class="item">
                            4
                        </a>
                        <a class="item">
                            5
                        </a>
                        <a class="item">
                            6
                        </a>
                        <a class="item">
                            7
                        </a>
                        <a class="item">
                            8
                        </a>
                        <a class="item">
                            下一页
                        </a>
                        <a class="item">
                            末页
                        </a>
                        -->
                    </div>
                </div>
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
    /*<![CDATA[*/

    /*$(function(){
        app.init(contextPath);
        myExamPage.init(pageNum, pageSize, totalPageNum, totalPageSize, grades);
    });*/
    /*]]>*/
</script>
</body>
</html>