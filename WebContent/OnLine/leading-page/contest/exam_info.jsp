 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8" />
    <title>考试详情</title>
    <!-- 试卷列表 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/OnLine/css/app.css" />
    <link rel="stylesheet"  href=" ${pageContext.request.contextPath }/OnLine/css/home.css" />
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/OnLine/css/contest/index.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/OnLine/css/exam_info.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/jquery/jquery-3.3.1.min.js"></script>
    <!-- <script type="text/javascript" src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/jquery/semantic.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/contest/index.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/home.js"></script>
    
    
</head>
<body>
<%@include file="/OnLine/common_head.jsp" %>
<div class="ui header container">
    <div class="ui large breadcrumb">
        <a class="section" href="${pageContext.request.contextPath}/online/home"><i class="home icon"></i>首页</a>
        <i class="right chevron icon divider"></i>
        <div class="active section">考试记录</div>
    </div>
</div>

<div class="ui contestList container">
   <div class="result-subject-item">
		<h1>每题得分</h1>
			<ul class="subject-num-list" id="ulTitle">
				<!-- <li class="correct-order">
					区分是否移入
					<a class="done-hover " href="https://www.nowcoder.com/profile/495320559/test/27154049/579632#summary" data-qid="579632">
					1
					</a>
				</li>
				<li class="error-order">
					<a class="" href="https://www.nowcoder.com/profile/495320559/test/27154049/579633#summary" data-qid="579633">
					2
				</a>
				</li> -->
			</ul>
		</div>
			<div class="result-question-box">
			<div class="subject-question">
			<span class="question-number" id="number">1</span>
			<div class="question-main" id="title">对于int&nbsp;*pa[5]&nbsp;;的描述，正确的是（&nbsp;&nbsp;&nbsp;&nbsp;）</div>
			</div>
		</div>
	<!-- 答题区域 -->
	<div class="result-subject-item result-subject-answer">
	<h1>
	<span id="checkedAnswer">
		正确答案:
		D
	</span>
	<span id="yourAnser">
		&nbsp;&nbsp;你的答案: D
	</span>
	
	<!-- font- -->
	<!-- 遗憾 -->
	<!-- <span  id="trueOrFalse">(正确)</span> -->
	</h1>
	<div id="answerDomain">
		<!-- <div class="result-answer-item">
			<pre>pa[5]表示某个数组第5个元素的值</pre>
		</div>
		<div class="result-answer-item green-answer-item">
			<pre>pa是一个具有5个元素的指针数组，每个元素是一个int型指针</pre>
		</div> -->
	
	</div>
	
	
	<div id="parseAnswers" style="font-size: 16px">
		
	</div>
	
		
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
<script type="text/javascript">

/* <li class="correct-order">
<a class="done-hover " href="https://www.nowcoder.com/profile/495320559/test/27154049/579632#summary" data-qid="579632">
1
</a>
</li>
 */
   var obj = {
		data: {
			personQuestion:[],
			allQuestion:[],
			currentIndex:0
		},	 
 		init:function(data){
 			obj.data.allQuestion = data.alluestion;
 			obj.data.personQuestion = data.personQuestion;
			// 渲染按钮
			obj.renderBtn(obj.data.allQuestion);
 		},
 		changeBtn : function(index){
 			
			obj.data.currentIndex = index;
 			var btn = '';////   
			for(var i = 0 ; i<obj.data.allQuestion.length;i++){
				// 单选
				//1,先找出正确答案id
				var trueS = '';
				var flag = 'error-order';
				// 多选情况分割
				if(obj.data.allQuestion[i].questionTypeId == 2){
					// 校验正确答案. 赋值到trueS中
					// 记录正确答案到数组中	
					var answerArr = new Array();
					for(var j= 0;j<obj.data.allQuestion[i].answerList.length;j++){
						if(obj.data.allQuestion[i].answerList[j]!=undefined){
							if(obj.data.allQuestion[i].answerList[j].isAnswerTrue == 1){
								answerArr.push(obj.data.allQuestion[i].answerList[j].answerId);
							}
						}
					}
					for(var j = 0 ; j< obj.data.personQuestion.length;j++){
						if(obj.data.allQuestion[i].questionId == obj.data.personQuestion[j].questionId){
							// 走数组
							var count = 0 ;
							var temp =[];  
							if(obj.data.personQuestion[j].myAnswer!=null){
								temp= obj.data.personQuestion[j].myAnswer.split(",");
									for(var y = 0 ;y<answerArr.length;y++){
										for(var x = 0 ; x<temp.length ;x++){
											if(answerArr[y]== temp[x]){
												count++;	
											}
										}
									}
							}
							if(count == answerArr.length && answerArr.length == temp.length){
								flag = 'correct-order';
							}
						}
					}
					
				}
				
				else{ 
					
					for(var j= 0;j<obj.data.allQuestion[i].answerList.length;j++){
						if(obj.data.allQuestion[i].answerList[j]!=undefined){
							if(obj.data.allQuestion[i].answerList[j].isAnswerTrue == 1){
								trueS =obj.data.allQuestion[i].answerList[j].answerId;
							}
						}
					}
					for(var j = 0 ; j< obj.data.personQuestion.length;j++){
						if(obj.data.allQuestion[i].questionId == obj.data.personQuestion[j].questionId){
							if(obj.data.personQuestion[j].myAnswer == trueS){
								flag = 'correct-order';
							}
						}
					}
				}
				
				
				if(i == obj.data.currentIndex){
					btn += '<li class="'+flag+'"><a class="done-hover " href="#">'+(i+1)+'</a></li>'
				}else{
					btn += '<li class='+flag+'><a class="" href="javascript:void(0)" onclick="obj.changeBtn('+i+')" >'+(i+1)+'</a></li>'
				}
			}
			
 			
			// 渲染按钮
			$("#ulTitle").html(btn);
			// 渲染第一道题目
			$("#number").html(obj.data.currentIndex+1);
			$("#title").html(obj.data.allQuestion[obj.data.currentIndex].questionContent+" ("+obj.data.allQuestion[obj.data.currentIndex].questionScore+") 分");
			// 循环当前题目的答案案
			var answerDiv = '';
			var trueParse = "答案解析：" ;
			// 记录正确答案，
			var treuAnswer=new Array();
			var myAnswer = new Array();
			for(var i = 0 ;i< obj.data.allQuestion[obj.data.currentIndex].answerList.length;i++){
				if(obj.data.allQuestion[obj.data.currentIndex].answerList[i]!=undefined){
					if(obj.data.allQuestion[obj.data.currentIndex].answerList[i].isAnswerTrue == 1){
						treuAnswer.push(obj.data.allQuestion[obj.data.currentIndex].answerList[i].answerSelect);
						answerDiv+='<div class="result-answer-item green-answer-item"><pre>'+obj.data.allQuestion[obj.data.currentIndex].answerList[i].answerSelect+" ."+obj.data.allQuestion[obj.data.currentIndex].answerList[i].answerContent+'</pre></div>';
						trueParse+=obj.data.allQuestion[obj.data.currentIndex].answerList[i].answerTruePaese+" - "
						for(var j =0;j<obj.data.personQuestion.length;j++){
							if(obj.data.personQuestion[j].questionId == obj.data.allQuestion[obj.data.currentIndex].questionId){
								//1记录我的答案，并记录正确还是错误
								//myAnser=obj.data.personQuestion[j].answerSelect;
								// 查找所有答案
								for(var k = 0 ; k< obj.data.personQuestion[j].answerList.length ;k++){
									if(obj.data.personQuestion[j].answerList[k]!=undefined){
										if(obj.data.personQuestion[j].answerList.length != myAnswer.length){
											myAnswer.push(obj.data.personQuestion[j].answerList[k].answer_select);
										}
									}
								}
							}
						}
					}else{
						answerDiv+='<div class="result-answer-item "><pre>'+obj.data.allQuestion[obj.data.currentIndex].answerList[i].answerSelect+" ."+obj.data.allQuestion[obj.data.currentIndex].answerList[i].answerContent+'</pre></div>';		 
					}
				}
			}
			
			
			
			$("#checkedAnswer").html("正确答案："+treuAnswer.join());
			
			$("#yourAnser").html(" &nbsp;&nbsp;你的答案："+myAnswer.join());
			
			$("#subPageMenu").html("<button class='item' onclick='obj.changeBtn("+(index-1 <0 ? 0:index-1 )+")'>上一题</button><button class='item' onclick='obj.changeBtn("+(index+1>=obj.data.allQuestion.length ? obj.data.allQuestion.length-1 : index+1 )+")'>下一题</button>");
			
			$("#answerDomain").html(answerDiv);
 			
			$("#parseAnswers").html(trueParse);
			// 正确或者错误的显示。
			
			
 		},
 		renderBtn:function(allQuestion){
 			debugger;
 			var btn = '';////   
			for(var i = 0 ; i<allQuestion.length;i++){
				// 单选
				//1,先找出正确答案id
				var trueS = '';
				var flag = 'error-order';
				// 多选情况分割
				if(allQuestion[i].questionTypeId == 2){
					// 校验正确答案. 赋值到trueS中
					// 记录正确答案到数组中	
					var answerArr = new Array();
					for(var j= 0;j<allQuestion[i].answerList.length;j++){
						if(allQuestion[i].answerList[j]!=undefined){
							if(allQuestion[i].answerList[j].isAnswerTrue == 1){
								answerArr.push(allQuestion[i].answerList[j].answerId);
							}
						}
					}
					for(var j = 0 ; j< obj.data.personQuestion.length;j++){
						if(allQuestion[i].questionId == obj.data.personQuestion[j].questionId){
							// 走数组
							var count = 0 ;
							var temp =[];  
							if(obj.data.personQuestion[j].myAnswer!=null){
								temp= obj.data.personQuestion[j].myAnswer.split(",");
									for(var y = 0 ;y<answerArr.length;y++){
										for(var x = 0 ; x<temp.length ;x++){
											if(answerArr[y]== temp[x]){
												count++;	
											}
										}
									}
							}
							if(count == answerArr.length && answerArr.length == temp.length){
								flag = 'correct-order';
							}
						}
					}
					
				}
				
				else{ 
					
					for(var j= 0;j<allQuestion[i].answerList.length;j++){
						if(allQuestion[i].answerList[j]!=undefined){
							if(allQuestion[i].answerList[j].isAnswerTrue == 1){
								trueS =allQuestion[i].answerList[j].answerId;
							}
						}
					}
					for(var j = 0 ; j< obj.data.personQuestion.length;j++){
						if(allQuestion[i].questionId == obj.data.personQuestion[j].questionId){
							if(obj.data.personQuestion[j].myAnswer == trueS){
								flag = 'correct-order';
							}
						}
					}
					
				}
				if(i == obj.data.currentIndex){
					btn = '<li class="'+flag+'"><a class="done-hover " href="#">'+(i+1)+'</a></li>'
				}else{
					btn += '<li class='+flag+'><a class="" href="javascript:void(0)" onclick="obj.changeBtn('+i+')" >'+(i+1)+'</a></li>'
				}
				
	 			
			}
 			
			// 渲染按钮
			$("#ulTitle").html(btn);
			// 渲染第一道题目
			$("#number").html(obj.data.currentIndex+1);
			$("#title").html(allQuestion[obj.data.currentIndex].questionContent+" ("+allQuestion[obj.data.currentIndex].questionScore+") 分");
			// 循环当前题目的答案案
			var answerDiv = '';
			var trueParse = "答案解析：" ;
			// 记录正确答案，
			var treuAnswer=new Array();
			var myAnswer = new Array();
			for(var i = 0 ;i< allQuestion[obj.data.currentIndex].answerList.length;i++){
				if(allQuestion[obj.data.currentIndex].answerList[i]!=undefined){
					if(allQuestion[obj.data.currentIndex].answerList[i].isAnswerTrue == 1){
						treuAnswer.push(allQuestion[obj.data.currentIndex].answerList[i].answerSelect);
						answerDiv+='<div class="result-answer-item green-answer-item"><pre>'+allQuestion[obj.data.currentIndex].answerList[i].answerSelect+" ."+allQuestion[obj.data.currentIndex].answerList[i].answerContent+'</pre></div>';
						trueParse+=obj.data.allQuestion[obj.data.currentIndex].answerList[i].answerTruePaese+" - "
						for(var j =0;j<obj.data.personQuestion.length;j++){
							if(obj.data.personQuestion[j].questionId == allQuestion[obj.data.currentIndex].questionId){
								//1记录我的答案，并记录正确还是错误
								//myAnser=obj.data.personQuestion[j].answerSelect;
								// 查找所有答案
								for(var k = 0 ; k< obj.data.personQuestion[j].answerList.length ;k++){
									if(obj.data.personQuestion[j].answerList[k]!=undefined){
										if(obj.data.personQuestion[j].answerList.length != myAnswer.length){
											
											myAnswer.push(obj.data.personQuestion[j].answerList[k].answer_select);
										}
									}
								}
							}
						}
					}else{
						answerDiv+='<div class="result-answer-item "><pre>'+allQuestion[obj.data.currentIndex].answerList[i].answerSelect+" ."+allQuestion[obj.data.currentIndex].answerList[i].answerContent+'</pre></div>';		 
					}
				}
			}
			$("#checkedAnswer").html("正确答案："+treuAnswer.join());
			
			$("#yourAnser").html(" &nbsp;&nbsp; 你的答案："+myAnswer.join());  // 关联到左表查询。
			// 是否正确
			$("#subPageMenu").html("<button class='item' onclick='obj.changeBtn("+(obj.data.currentIndex-1 <0 ? 0:obj.data.currentIndex-1 )+")'>上一题</button><button class='item' onclick='obj.changeBtn("+(obj.data.currentIndex+1>=obj.data.allQuestion.length ? obj.data.allQuestion.length-1 : obj.data.currentIndex+1 )+")'>下一题</button>");
			$("#answerDomain").html(answerDiv);
			$("#parseAnswers").html(trueParse);
			
 		}
 		
 	}
	$(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/online/person/exam/info?userId=${userId}&taskId=${taskId}",
			type:"GET",
			success:function(data){
				// 循环该任务下的所有的题目
				obj.init(data);				
			}
		})
		
		
		
		
	})
</script>
</body>
</html>