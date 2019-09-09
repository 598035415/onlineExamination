<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8" />
    <title>ZNSD在线考试系统</title>
    <!-- 试卷题目界面 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/OnLine/css/app.css" />
    <link rel="stylesheet"  href=" ${pageContext.request.contextPath }/OnLine/css/home.css" />
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/OnLine/css/contest/detail.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/jquery/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/semantic-ui/2.2.13/semantic.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery.countdown/2.2.0/jquery.countdown.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/OnLine/js/contest/index.js"></script>
    
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/app.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath }/OnLine/js/home.js"></script>
</head>
<body>
<%@include file="/OnLine/common_head.jsp" %>

<div class="ui header container">
    <div class="ui large breadcrumb">
        <a class="section" href="${pageContext.request.contextPath}/online/task/list"><i class="home icon"></i>在线考试列表</a>
        <i class="right chevron icon divider"></i>
        <div class="section">${examInfo.examPaperTitle}</div>
    </div>
</div>

<div class="ui problemDetail container">
    <div class="ui secondary pointing menu">
        <a class="active item"><i class="block layout icon"></i>题目详情</a>
    </div>
    <%-- ${taskId} --------> ${examInfo} --%>
    <div class="ui grid">
        <!-- 选择题,问答题 -->
        <div class="ten wide column">
            <div class="row">
                <div class="ui stacked segment">
                    <h4 class="ui horizontal divider header"><i class="help circle icon"></i>题目描述</h4>
                    <!-- 题目描述区域 -->
                    <p style="font-size: 16px;" id="currentQuetionTitle">
                    	(单选)下列哪一个 Transact-SQL 语句能够实现收回 user2 查询基本表 T 的权限？（ ）(5分)
                    </p>
                </div>
            </div>
            <!-- 编程题 -->
            <div class="row" style="margin-top: 1em;">
                <div class="ui segment">
                    <h5 class="ui dividing header">作答区</h5>
			            <!--  单选按钮区域。--> 
	                	<div class="ui form" id="currentQuestionAnswer">
	                		<!-- <div class="grouped fields">
						    <div class="field">
						      <div class="ui toggle checkbox">
						        <input type="radio" name="questionAnswer" value="A">
						        <label>A.&nbsp;&nbsp;REVOKE UPDATE ON T</label>
						      </div>
						    </div>
						    <div class="field">
						      <div class="ui toggle checkbox">
						        <input type="radio" name="questionAnswer" value="B">
						        <label>B.&nbsp;&nbsp;GRANT SELECT ON T TO user2</label>
						      </div>
						    </div>
						    <div class="field">
						      <div class="ui toggle checkbox">
						        <input type="radio" name="questionAnswer" value="C">
						        <label>C.&nbsp;&nbsp;DENY SELECT ON T TO user2</label>
						      </div>
						    </div>
						    <div class="field">
						      <div class="ui toggle checkbox">
						        <input type="radio" name="questionAnswer" value="D">
						        <label>D.&nbsp;&nbsp;REVOKE SELECT ON T FROM user2</label>
						      </div>
						    </div>
						  </div> -->
	                	</div>
	                	
	                	
                </div>
            </div>
        </div>
        <div class="one wide column">
        </div>
        
        <div class="four wide column"  >
            <div class="row" style="width: 310px;">
                <table class="ui table">
                    <tbody>
                    <tr>
                        <td><span style="font-weight: bolder;">班级:</span></td>
                        <td><span >${examInfo.clazzName}</span></td>
                    </tr>
                    <tr>
                        <td><span style="font-weight: bolder;">当前考生:</span></td>
                        <td><span>${preCurrentUser.username}</span></td>
                    </tr>
                    <tr>
                        <td><span style="font-weight: bolder;">剩余时间:</span></td>
                        <!-- 此处为动态倒计时  00:01:39:25 -->
                        <td><span id="contestTimeCountdown">  </span></td>
                    </tr>
                    <tr>
                        <td><span style="font-weight: bolder;">开始时间:</span></td>
                        <td><span ><fmt:formatDate value="${examInfo.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
                    </tr>
                    <tr>
                        <td><span style="font-weight: bolder;">结束时间:</span></td>
                        <td><span ><fmt:formatDate value="${examInfo.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
                    </tr>
                    <tr>
                        <td><span style="font-weight: bolder;">总分:</span></td>
                        <td><span >${examInfo.examPaperTotalScroe}</span></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="row" style="margin-top: 1em;" >
                <div class="ui segment " style="width: 310px;">
                    <div class="title">答题卡</div>
                    <div class="content ui segment" id="currentQuestionButton">
                        <!-- <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            1
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            2
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            3
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            4
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            5
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            6
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            7
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            8
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            9
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            10
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            11
                        </button>
                        <button class="mini ui button" style="margin-top: 10px;margin-left: 5px;">
                            11
                        </button> -->
                    </div>
                    <div class="extra content">
                        <button type="button" onclick="contestDetailPage.finishContestAction()" class="ui positive button">交卷</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="one wide column">
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
                <!--
                TODO::pv,uv统计
                <span id='cnzz_stat_icon_1261763113'></span>
                <script src='@{//s95.cnzz.com/stat.php?id=1261763113&amp;online=1&amp;show=line}' type='text/javascript'></script>
                -->
            </div>
        </div>
    </div>
</div>
<!-- 正在提交试卷模态框 -->
<div class="ui mini modal" id="waitSubmitModal">
    <div class="header">信息</div>
    <div class="content" style='font-size:18px; '>
        请耐心等候,正在为您提交答题卡......
    </div>
</div>

<div class="ui mini modal" id="forwrdModal">
    <div class="header">信息</div>
    <div class="content" id="resultMsg" style='font-size:18px; '>
        
    </div>
    <div style="margin-left: 15px;margin-bottom: 5px">
	    <button type="button" id="confirm"  class='ui positive button' >确认</button>
	    <button type="button" id="rollback" class='ui positive button'>取消 </button>
    </div>
    
</div>
</body>
<!-- 查找题目 -->
<script type="text/javascript">
	$(function(){
		$("#confirm").on("click",function(){
			var testArr = $(this).attr("diy").split(",");
			// 进入详情
			location.href="${pageContext.request.contextPath}/online/inner/exam/info?userId="+testArr[0]+"&taskId="+testArr[1];
		})
		$("#rollback").on("click",function(){
			// 隐藏模态框，并跳转。
			$("#forwrdModal").modal("hide");
			setTimeout( function() {
				location.href="${pageContext.request.contextPath}/online/task/list";
			}, 800);
		})
	})
	var contestDetailPage = {
			data: {
				contest: null,
	            questions: [],
	            currentQuestionIndex: 0,
			},
			init:function(questions){
				contestDetailPage.data.questions = questions;
				// 初始化时，开启倒计时
				$("#contestTimeCountdown").countdown(new Date('${examInfo.endTime}'),function(event){
					// 秒执行单位 ,// 定义格式
					var format = event.strftime('%D:%H:%M:%S');
					// 渲染倒计时
					$("#contestTimeCountdown").html(format);			
				}).on('finish.countdown',function(){
					//  到时间后交卷时间触发
					 contestDetailPage.finishContestAction();
				})
				// 渲染答题卡	
				contestDetailPage.renderQuestionCard();
				// 渲染一个题目。
				contestDetailPage.rederOneQuestion(0);
				
			},
			// 交卷事件
			finishContestAction:function(){
				// 1，记录答案，用户选中的。
				var index = contestDetailPage.data.currentQuestionIndex;
				
				var answerAllJson = {
					taskId:'${taskId}',
					questionAnswers:[]
				};
				// 有单选，有复选。
				var questionsAnswer = new Array();
				//1，把所有不是当前索引的数据存储到json中
				for(var i = 0 ; i< contestDetailPage.data.questions.length;i++){
					// 不是当前索引的时候
					if(i!=index){
						// 循环所有答案
						json = null;
						var idStr= new Array();
						for(var j= 0 ; j< contestDetailPage.data.questions[i].answerList.length ; j++){
							// 如果为选中状态，则赋值
							if(contestDetailPage.data.questions[i].answerList[j]!=undefined){
								if(contestDetailPage.data.questions[i].answerList[j].flag == 'checked'){
									if(contestDetailPage.data.questions[i].questionTypeId == 2){
										// 多选结构
										idStr.push(contestDetailPage.data.questions[i].answerList[j].answerId);
										 json={
											 questionId: contestDetailPage.data.questions[i].questionId,
											 answerId : idStr.join()
										 }
									}else{
										// 单选结构
										json = {
												questionId: contestDetailPage.data.questions[i].questionId,
												answerId : contestDetailPage.data.questions[i].answerList[j].answerId
										}
									}
								}
							}
						}
						if(json!=null){
							questionsAnswer.push(json);
						}
					}
				}
				jsonSimple = null;
				var idStrSimple = new Array();
				// 当前的 ,如果是当前这条的话，直接循环选中的即可，拿出结果id
				$("input[name='questionAnswer']:checked").each(function(){
					idStrSimple.push(this.value);
				})
				jsonSimple={
					questionId : contestDetailPage.data.questions[index].questionId,
					answerId : idStrSimple.join() 
				}
				if(jsonSimple!=null){
					questionsAnswer.push(jsonSimple);
				}
				if(questionsAnswer!=null){
					answerAllJson.questionAnswers=questionsAnswer;
				}
				// 执行交卷请求
				contestDetailPage.submitPage(answerAllJson);
				
			},
			//执行交卷ajax请求
			submitPage:function(infoData){
				// 执行正在交卷效果，ajax请求成功后，弹出页面
				$('#waitSubmitModal').modal({closable  : false,blurring: true,}).modal('show');
				// 两秒后关闭。
				setTimeout(function(){
					$("#waitSubmitModal").modal("hide");
				}, 1700);
				
				$.ajax({
					url:"${pageContext.request.contextPath}/online/submitPage",
					type:"POST",
					data:"taskId=${taskId}&jsonStr="+JSON.stringify(infoData.questionAnswers),
					success:function(result){
						// 渲染信息
						$("#resultMsg").html(result.msg);
						// id
						$("#confirm").attr("diy",result.data); // 用户id，
						// 1 秒后执行跳转。
						setTimeout( function(){
							$('#forwrdModal').modal({closable  : false,blurring: true,}).modal('show');
						}, 1600);
					}
				})
			}
			,
			renderQuestionCard:function(){
				var cardStrBtn = '';
				// 1,循环所有答案
				for(var i = 0 ; i<contestDetailPage.data.questions.length; i++ ){
					var buttonStr = '';
					if(contestDetailPage.data.currentQuestionIndex == i){
						// 如果是第一个带选中，并没有点击事件。
						buttonStr = '<button class="mini ui positive button"  style="margin-top: 10px;margin-left: 5px;">'+(i+1)+'</button>';
					}else{
						 buttonStr ='<button class="mini ui button" onclick="contestDetailPage.targetQuestionAction('+i+')" style="margin-top: 10px;margin-left: 5px;">'+(i+1)+'</button>';
					}
					cardStrBtn+=buttonStr;
				}
				
				$("#currentQuestionButton").html(cardStrBtn);
			},
			// 切换题目
			targetQuestionAction:function(index){
				// 先拿到 前一个 索引，判断是否有选中，如果有，则选中
	            var preIndex = contestDetailPage.data.currentQuestionIndex;
	            // 重置当前索引，设置当前选中的索引。
	            contestDetailPage.data.currentQuestionIndex = index;
	         	// 记录答案 ，前一个索引的答案记录下来。 如果是 单选或者是判断
	         	if(contestDetailPage.data.questions[preIndex].questionTypeId == 2){
	         	// 每循环一个选中的答案加一个checked属性
                    for(var i = 0 ;i<contestDetailPage.data.questions[preIndex].answerList.length;i++){
                   	 if(contestDetailPage.data.questions[preIndex].answerList[i] !=undefined){
                   		 contestDetailPage.data.questions[preIndex].answerList[i].flag = null;
                   	 }
                    }
	         	}
            	 $.each($("input[name='questionAnswer']:checked"),function(){
            		// 每循环一个选中的答案加一个checked属性
                     for(var i = 0 ;i<contestDetailPage.data.questions[preIndex].answerList.length;i++){
                    	 if(contestDetailPage.data.questions[preIndex].answerList[i] !=undefined){
                    		 if( this.value == contestDetailPage.data.questions[preIndex].answerList[i].answerId ){
	                    		 contestDetailPage.data.questions[preIndex].answerList[i].flag = "checked";
	                    	 }
                    	 }
                     }
                 });
                 
	         	
	         	// 渲染作答区，答案区域
            	contestDetailPage.rederOneQuestion(index);   
            	//显示之前作答区的答案，根据当前点击的节点
            	 $.each($("input[name='questionAnswer']"),function(){
            		// 每循环一个选中的答案加一个checked属性
            		for(var i = 0 ; i<contestDetailPage.data.questions[index].answerList.length;i++){
            			 if(contestDetailPage.data.questions[index].answerList[i] !=undefined){
	            			if(this.value == contestDetailPage.data.questions[index].answerList[i].answerId ){
		                   			$(this).attr("checked", contestDetailPage.data.questions[index].answerList[i].flag);
	                   	 	} 
            			 }	
                    }
                }); 
            	// 渲染答题卡按钮效果。
                contestDetailPage.renderQuestionCard();
			},
			// 渲染第一个题目的函数
			rederOneQuestion:function(index){
				// 1，单选，2多选 3，判断
				if(contestDetailPage.data.questions.length == 0){
					$('#currentQuetionTitle').html("无题目");
					return;
				}
				// 单选或者判断题情况
				if(contestDetailPage.data.questions[index].questionTypeId == 1 || contestDetailPage.data.questions[index].questionTypeId == 3 ){
					// 渲染题目描述
					$('#currentQuetionTitle').html('<b>('+contestDetailPage.data.questions[index].questionType+')</b>'+contestDetailPage.data.questions[index].questionContent+'('+contestDetailPage.data.questions[index].questionScore+'分)');
					 // 生成作答区, 每循环一个创建一个答案。
	                 var totalOptionStr = ''
					 if(contestDetailPage.data.questions[index].answerList.length>0){
	                	 for(var i = 0 ;i<contestDetailPage.data.questions[index].answerList.length;i++){
							 var selectOptionStr = '<div class="grouped fields">\n' +
			                    '    <div class="field">\n' +
			                    '      <div class="ui toggle checkbox">\n' +
			                    '        <input type="radio" name="questionAnswer" value="'+contestDetailPage.data.questions[index].answerList[i].answerId+'"/>\n' +
			                    '        <label>'+contestDetailPage.data.questions[index].answerList[i].answerSelect+'.&nbsp;&nbsp;'+contestDetailPage.data.questions[index].answerList[i].answerContent+'</label>\n' +
			                    '      </div>\n' +
			                    '    </div>';
							 totalOptionStr += selectOptionStr;
	                	 }
	                 }
	                 $('#currentQuestionAnswer').html(totalOptionStr+"<button type='button' onclick='contestDetailPage.targetQuestionAction("+(index-1 <0 ? 0:index-1 )+")'  class='ui positive button'>上一题</button><button type='button'  onclick='contestDetailPage.targetQuestionAction("+(index+1>=contestDetailPage.data.questions.length ? contestDetailPage.data.questions.length-1 : index+1 )+")' class='ui positive button'>下一题</button>");
					 
				}
				// 多选情况。
				else if (contestDetailPage.data.questions[index].questionTypeId == 2){
					// 渲染题目描述
					$('#currentQuetionTitle').html('<b>('+contestDetailPage.data.questions[index].questionType+')</b>'+contestDetailPage.data.questions[index].questionContent+'('+contestDetailPage.data.questions[index].questionScore+'分)');
					 	var totalOptionStr = ''
						 if(contestDetailPage.data.questions[index].answerList.length>0){
							 for(var i = 0 ;i<contestDetailPage.data.questions[index].answerList.length;i++){
								 var selectOptionStr = '<div class="grouped fields">\n' +
				                    '    <div class="field">\n' +
				                    '      <div class="ui toggle checkbox">\n' +
				                    '        <input type="checkbox" name="questionAnswer" value="'+contestDetailPage.data.questions[index].answerList[i].answerId+'"/>\n' +
				                    '        <label>'+contestDetailPage.data.questions[index].answerList[i].answerSelect+'.&nbsp;&nbsp;'+contestDetailPage.data.questions[index].answerList[i].answerContent+'</label>\n' +
				                    '      </div>\n' +
				                    '    </div>\n' +
				                    '  </div>';
								 totalOptionStr +=selectOptionStr;
							 }
						 }
					 	$('#currentQuestionAnswer').html(totalOptionStr+"<button type='button' onclick='contestDetailPage.targetQuestionAction("+(index-1 <0 ? 0:index-1 )+")'  class='ui positive button'>上一题</button><button type='button'  onclick='contestDetailPage.targetQuestionAction("+(index+1>=contestDetailPage.data.questions.length ? contestDetailPage.data.questions.length-1 : index+1 )+")' class='ui positive button'>下一题</button>");
				}
				
				
			}
	}
	
	$(function(){
		// 初始化所有题目,
		$.ajax({
			url:"${pageContext.request.contextPath}/online/exam/render/${taskId}",
			type:"GET",
			success:function(result){
				contestDetailPage.init(result);
			}
		})
		// 所有问题，包括单选，多选，判断，等等。动态渲染，作答区，下一题，答题卡等。
	})
</script>
