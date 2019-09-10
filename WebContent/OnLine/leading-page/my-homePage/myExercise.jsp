<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8" />
    <title>GDUFE在线考试系统</title>
    <!-- 个人所有考试记录 -->
	 <link rel="stylesheet" href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/OnLine/css/app.css" />
     <link rel="stylesheet"  href=" ${pageContext.request.contextPath }/OnLine/css/home.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/home.js"></script>

</head>
<body>
<%@include file="/OnLine/common_head.jsp" %>
<div class="ui main container">
    <div class="ui grid">
        <%@include file="/OnLine/common_center_left.jsp"%>
        
        <div class="twelve wide column">
            <div class="ui segment">
                <h4 class="ui dividing header">练习记录</h4>
                
               <div class="ui three cards">
               <c:forEach items="${page.resultList}"  var="item">
               
	                		<div class="ui card paper" >
	                        <div class="content">
	                            <div class="header paper-title">${item.testName}</div>
	                        </div>
	                        <div class="extra content paper-type" style="background-color: #9ED5C9;color: #FFFFFF;" >
	                            ${studentId}
	                        </div>
	                        <div class="content">
	                            <div class="ui small feed">
	                                <div class="event">
	                                    <div class="content">
	                                        <div class="summary"><a><i class="wait icon"></i>完成时间&nbsp;:&nbsp;</a><span class="paper-finish-time" >
	                                        <c:if test="${item.createTime!=null}">
		                                        <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                                        </c:if>
	                                        
	                                        </span></div>
	                                    </div>
	                                </div>
	                                <div class="event">
	                                    <div class="content">
	                                        <div class="summary"><a><i class="database icon"></i>正确率&nbsp;:&nbsp;</a><span > ${item.accuracy}</span></div>
	                                    </div>
	                                </div>
	                                <div class="event">
	                                    <div class="content">
	                                        <div class="summary"><a><i class="trophy icon"></i>用时&nbsp;:&nbsp;</a><span>${item.totalTime}</span></div>
	                                    </div>
	                                </div> 
	                            </div>
	                        </div>
	                    </div>
	                
               </c:forEach>
	                </div>
                
                
                <!-- 分页    -->    
                <div class="ui container" style="margin-top: 15px" >
                    <div class="ui pagination menu" id="subPageMenu">
                        
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
	//分页
	function taskList(currentPage){
		location.href="${pageContext.request.contextPath}/person/exercise/rows?currentPage="+currentPage;
	}
</script>
<script type="text/javascript">
		$(function(){
			//num 是当前页面数 profile = 0 password = 1 myExam = 2 myExercise = 3
			var num = 3;
			$("#navigationLink .content:eq("+num+")").append("<i class='pointing left icon'></i>")
		})
	</script>
</body>
</html>