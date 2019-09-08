<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>GDUFE在线考试系统</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
<link rel="stylesheet"
	href="https://cdn.bootcss.com/highlight.js/9.12.0/styles/atom-one-dark.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/css/app.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/OnLine/css/problem/problemdetail.css" />
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/highlight.js/9.12.0/highlight.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/OnLine/js/problem/problemdetail.js"></script>
</head>
<body>
	<div class="ui fixed inverted menu">
		<a href="${pageContext.request.contextPath }/OnLine/leading-page/home.jsp"
			class="header item"> 
			<img class="ui"
			src="${pageContext.request.contextPath }/OnLine/img/logo.png"
			width="156" height="32" alt="" />
		</a> <a
			href="${pageContext.request.contextPath }/OnLine/contest/index.html"
			href="#" class="item"> <i class="desktop icon"></i>在线考试
		</a> <a
			href="${pageContext.request.contextPath }/OnLine/problem/problemset.html"
			class="active item"> <i class="list layout icon"></i>题库中心
		</a> <a
			href="${pageContext.request.contextPath }/OnLine/my-homePage/myExam.html"
			class="item"> <i class="talk icon"></i>考试记录
		</a>
		<!--<a onclick="'app.showLogin()'" class="right item" if="${current_account == null}">
        <i class="sign in icon"></i>登录
    </a>-->
		<div class="ui simple dropdown right item">
			<img class="ui avatar image"
				src="${pageContext.request.contextPath }/OnLine/img/${preCurrentUser.headPortrait}" />
			<span text="${current_account.name}"></span> <i class="dropdown icon"></i>
			<div class="menu">
				<a class="item" href="${pageContext.request.contextPath }/profile">
					<i class="user icon"></i>我的主页
				</a> <a class="item" id="logout"> <i class="sign out icon"></i>退出
				</a>
			</div>
		</div>
	</div>
	<div class="ui header container">
		<div class="ui large breadcrumb">
			<a class="section"
				href="${pageContext.request.contextPath }/OnLine/home.html"><i
				class="home icon"></i>首页</a> <i class="right chevron icon divider"></i>
			<a class="section"
				href="${pageContext.request.contextPath }/OnLine/problem/problemset.html">题库中心</a>
			<i class="right chevron icon divider"></i> <a class="section"
				href="problemlist.html" text="${data['subject'].name}">数据结构与算法</a> <i
				class="right chevron icon divider"></i>
			<div class="active section" text="${data['question'].title}">某保险公司多年的资料表明，在索赔户中，被盗索赔户占20%，以
				表示在随机抽查100个索赔户中因被盗而向保险公司索赔的户数，求 . x 0 0.5 1 1.5 2 2.5 3 Ф (x) 0.500
				0.691 0.841 0.933 0.977 0.994 0.999</div>
		</div>
	</div>


	<div class="ui problemDetail container">
		<div class="ui secondary pointing menu">
			<a class="active item"><i class="block layout icon"></i>题目详情</a>
		</div>
		<div class="ui grid">
			<!-- 选择题,问答题 -->
			<div class="ten wide column">
				<div class="row">
					<div class="ui stacked segment">
						<h4 class="ui horizontal divider header">
							<i class="help circle icon"></i>题目描述
						</h4>
						<p style="font-size: 16px;" text="${data['question'].content}">某保险公司多年的资料表明，在索赔户中，被盗索赔户占20%，以
							表示在随机抽查100个索赔户中因被盗而向保险公司索赔的户数，求 . x 0 0.5 1 1.5 2 2.5 3 Ф (x)
							0.500 0.691 0.841 0.933 0.977 0.994 0.999</p>
					</div>
				</div>
				<!-- 选择题 -->
				<div
					if="${data['question'].questionType == 0 or data['question'].questionType == 1}"
					class="row" style="margin-top: 1em;">
					<div class="ui segment">
						<h4 class="ui horizontal divider header">
							<i class="hashtag icon"></i>题目选项
						</h4>
						<div text="'A.'+${data['question'].optionA}" class="row"
							style="font-size: 16px;">A. 作业流</div>
						<div text="'B.'+${data['question'].optionB}" class="row"
							style="font-size: 16px;">B. 子程序</div>
						<div text="'C.'+${data['question'].optionC}" class="row"
							style="font-size: 16px;">C. 子进程</div>
						<div text="'D.'+${data['question'].optionD}" class="row"
							style="font-size: 16px;">D. 作业步</div>
					</div>
				</div>
				<div
					if="${data['question'].questionType == 0 or data['question'].questionType == 1}"
					class="row" style="margin-top: 1em;">
					<!-- 显示与隐藏 ，需要自己js控制-->
					<div class="ui accordion segment active">
						<div class="title active">
							<i class="dropdown icon"></i>查看正确答案
						</div>
						<div class="content ui segment active">
							<h4 class="ui dividing header">
								正确答案:<span text="${data['question'].answer}">A</span>
							</h4>
							<h4 class="ui dividing header">答案解析:</h4>
							<p style="font-size: 16px; font-weight: bold;"
								text="${data['question'].parse}">
								Java虚拟机是一个可以执行Java字节码的虚拟机进程。Java源文件被编译成能被Java虚拟机执行的字节码文件。
								Java被设计成允许应用程序可以运行在任意的平台，而不需要程序员为每一个平台单独重写或者是重新编译。Java虚拟机让这个变为可能，因为它知道底层硬件平台的指令长度和其他特性。
							</p>
						</div>
					</div>
				</div>
				<!-- 简答题 -->
				<!--<div if="${data['question'].questionType == 2}" class="row" style="margin-top: 1em;">
                <div class="ui accordion segment">
                    <div class="title"><i class="dropdown icon"></i>查看正确答案</div>
                    <div class="content ui segment">
                        <h4 class="ui dividing header">参考答案:</h4>
                        <p style="font-size: 16px;font-weight: bold;" text="${data['question'].answer}">
                            Java虚拟机是一个可以执行Java字节码的虚拟机进程。Java源文件被编译成能被Java虚拟机执行的字节码文件。
                            Java被设计成允许应用程序可以运行在任意的平台，而不需要程序员为每一个平台单独重写或者是重新编译。Java虚拟机让这个变为可能，因为它知道底层硬件平台的指令长度和其他特性。
                        </p>
                    </div>
                </div>
            </div>-->
				<!-- 编程题 -->
				<!--
            	
            	<div if="${data['question'].questionType == 3}" class="row" style="margin-top: 1em;">
                <div class="ui accordion segment">
                    <div class="title"><i class="dropdown icon"></i>查看正确答案</div>
                    <div class="content ui segment">
                        <h4 class="ui dividing header">参考答案:</h4>
                        <pre><code class="Java" text="${data['question'].answer}">import java.util.Scanner;
public class Main {
public static void main(String[] args){
    Scanner scan = new Scanner(System.in);
    while(scan.hasNext()){
        int a = scan.nextInt();
        int b = scan.nextInt();
        System.out.println(String.format("%d", a + b));
    }
}
}
                        </code></pre>
                    </div>
                </div>
            </div>
            	
            -->
			</div>
			<div class="one wide column"></div>
			<div class="four wide column">
				<table class="ui table">
					<tbody>
						<tr>
							<td><span style="font-weight: bolder;">题目类型:</span></td>
							<td><span if="${data['question'].questionType == 0}">单选题</span>
								<!--<span if="${data['question'].questionType == 1}">多选题</span>
                        <span if="${data['question'].questionType == 2}">问答题</span>
                        <span if="${data['question'].questionType == 3}">编程题</span>-->
							</td>
						</tr>
						<tr>
							<td><span style="font-weight: bolder;">上传者:</span></td>
							<td><span><i class="user icon"></i>admin</span></td>
						</tr>
						<!-- <tr>
                    <td><span style="font-weight: bolder;">题目难度:</span></td>
                    <td>
                        <div if="${data['question'].difficulty == 1}" class="ui star rating" data-rating="1"></div>
                        <div if="${data['question'].difficulty == 2}" class="ui star rating" data-rating="2"></div>
                        <div if="${data['question'].difficulty == 3}" class="ui star rating" data-rating="3"></div>
                        <div if="${data['question'].difficulty == 4}" class="ui star rating" data-rating="4"></div>
                        <div if="${data['question'].difficulty == 5}" class="ui star rating" data-rating="5"></div>
                    </td>
                </tr>-->
						<%-- <tr>
                    <td><span style="font-weight: bolder;">发布时间:</span></td>
                    <td><span text="${#dates.format(data['question'].createTime, 'yyyy-MM-dd HH:mm:ss')}">2018-01-12 15:38:25</span></td>
                </tr>
                <tr>
                    <td><span style="font-weight: bolder;">更新时间:</span></td>
                    <td><span text="${#dates.format(data['question'].updateTime, 'yyyy-MM-dd HH:mm:ss')}">2018-01-12 15:38:25</span></td>
                </tr> --%>
					</tbody>
				</table>
			</div>
			<div class="one wide column"></div>
		</div>
	</div>
	<!-- 不可抗力元素 -->
	<div class="second-footer"></div>
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
							如有问题请发邮件到 zzqnxx@foxmail.com
						</div>
					</div>
				</div>
				<div class="right aligned column">
					&copy; 2018 GDUFE All Rights Reserved &nbsp;&nbsp; <br /> 网站版本：<a
						href="#">v1.0.0 Beta #20180109</a>&nbsp;&nbsp; 服务器时间：<span
						id="current_server_timer"></span> <br /> 站长统计 | 今日IP[91] |
					今日PV[4511] | 昨日IP[133] | 昨日PV[10109] | 当前在线[1]
					<!--
                TODO::pv,uv统计
                <span id='cnzz_stat_icon_1261763113'></span>
                <script src='@{//s95.cnzz.com/stat.php?id=1261763113&amp;online=1&amp;show=line}' type='text/javascript'></script>
                -->
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			app.init("${pageContext.request.contextPath}");
		});

		// 进入登录页面
		function innerLogin() {
			$('#loginModal').modal({
				/**
				 * 必须点击相关按钮才能关闭
				 */
				closable : false,
				/**
				 * 模糊背景
				 */
				blurring : true,
			}).modal('show');
		}
	</script>
</body>
</html>