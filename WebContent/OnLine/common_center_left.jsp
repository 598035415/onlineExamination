<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="four wide column">
		<div class="row">
			<div class="ui card">
				<div class="blurring dimmable image"></div>
				<div class="content">
					<div class="header">${ preCurrentUser.username}</div>
					<div class="meta">
						<!--<a class="group">信息学院</a>-->
						<div class="group">
							<i class="student icon"></i>  ${ preCurrentUser.clazzId}班
						</div>
					</div>
					<div class="description">
						laowu NB
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="margin-top: 1em;">
			<div class="ui card" id="navigationLink">
				<div class="content">
					<a href="${pageContext.request.contextPath }/profile"> 
						<i class="user icon"></i>个人信息
					</a> 
					<!-- <i class="pointing left icon"></i> -->
				</div>
				<div class="content">
					<a href="${pageContext.request.contextPath }/password"> 
					<i class="edit icon"></i>更改密码
					</a>
				</div>
				<div class="content">
					<a href="${pageContext.request.contextPath }/person/exam/rows"> 
					<i class="history icon"></i>考试记录
					</a>
				</div>
				<div class="content">
					<a href="${pageContext.request.contextPath }/person/exercise/rows"> 
					<i class="history icon"></i>练习记录
					</a>
				</div>
			</div>
		</div>

	</div>
</body>
</html>