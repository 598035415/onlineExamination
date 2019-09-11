<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加管理员-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/lib/layui/css/layui.css"  media="all">
</head>

<body>
<div class="weadmin-body">
	<form class="layui-form layui-form-pane" action="">
	  <div class="layui-form-item">
	    <label class="layui-form-label">试题类别</label>
	    <div class="layui-input-inline">
	      <select lay-filter="categoryParent">
	        <option value="">--请选择一级类别--</option>
	        <c:forEach var="categoryParent" items="${categoryParentList.data}">
	        	<c:choose>
	        		<c:when test="${categoryParent.id == currentQuestionCategory.parentId}">
	        			<option value="${categoryParent.id }" selected="selected">${categoryParent.categoryName }</option>
	        		</c:when>
	        		<c:otherwise>
	        			<option value="${categoryParent.id }">${categoryParent.categoryName }</option>
	        		</c:otherwise>
	        	</c:choose>
	        </c:forEach>
	      </select>
	    </div>
	    <div class="layui-input-inline">
	      <select name="questionCategory" id="questionCategory">
	        <option value="">--请选择二级类别--</option>
	        <c:forEach var="category" items="${allSonCategory.data}">
	        	<c:choose>
		        	<c:when test="${category.id == currentQuestionCategory.id}">
		        		<option value="${category.id }" selected="selected">${category.categoryName}</option>
		        	</c:when>
		        	<c:otherwise>
		        		<option value="${category.id }">${category.categoryName}</option>
		        	</c:otherwise>
	        	</c:choose>
	        </c:forEach>
	      </select>
	    </div>
	  </div>
	  
	  <div class="layui-form-item" pane="">
	    <label class="layui-form-label">选择类型</label>
	    <div class="layui-input-block">
	    	<c:forEach var="type" items="${typeList}">
	    		<c:choose>
	    			<c:when test="${type.id == question.questionType }">
	    				<input id="questionType" type="radio" name="questionType" value="${type.id}" title="${type.label}" lay-filter="questionType" checked="checked">		
	    			</c:when>
	    			<c:otherwise>
	    				<input id="questionType" type="radio" name="questionType" value="${type.id}" title="${type.label}" lay-filter="questionType">		
	    			</c:otherwise>
	    		</c:choose>
	    	</c:forEach>
	  	</div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">试题分值</label>
	    <div class="layui-input-block">
	      <input type="number" name="questionScore" autocomplete="off" placeholder="请输入题目分值" class="layui-input" value="${question.questionScore }">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">试题内容</label>
	    <div class="layui-input-block">
	      <input type="text" name="questionContent" autocomplete="off" placeholder="请输入题目内容" class="layui-input" value="${question.questionContent }">
	    </div>
	  </div>
	  <div class="layui-form-item answer" >
	    <label class="layui-form-label">A答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" answer-select="A" autocomplete="off" placeholder="请输入A答案内容" class="layui-input" value="${allAnswer[0].answerContent }">
	    </div>
	  </div>
	  <div class="layui-form-item answer">
	    <label class="layui-form-label">B答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" answer-select="B" autocomplete="off" placeholder="请输入B答案内容" class="layui-input" value="${allAnswer[1].answerContent }">
	    </div>
	  </div>
	  <div class="layui-form-item answer">
	    <label class="layui-form-label">C答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" answer-select="C" autocomplete="off" placeholder="请输入C答案内容" class="layui-input" value="${allAnswer[2].answerContent }">
	    </div>
	  </div>
	  <div class="layui-form-item answer">
	    <label class="layui-form-label">D答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" answer-select="D" autocomplete="off" placeholder="请输入D答案内容" class="layui-input" value="${allAnswer[3].answerContent }">
	    </div>
	  </div>
	  <!-- 单选题答案列表-->
	  <div class="layui-form-item radio">
	    <label class="layui-form-label">正确答案</label>
	    <div class="layui-input-block" id="oneOption">
	    	<c:forEach var="select" items="${selectList }" varStatus="i">
	    		<c:choose>
	    			<c:when test="${select.label == allAnswer[i.index].answerSelect and allAnswer[i.index].isAnswerTrue == 1 }">
	    				<input type="radio" name="isAnswerTrue1" data-index="${i.index }" value="${select.id }" title="${select.label }" checked="checked">	
	    			</c:when>
	    			<c:otherwise>
	    				<input type="radio" name="isAnswerTrue1" data-index="${i.index }" value="${select.id }" title="${select.label }">
	    			</c:otherwise>
	    		</c:choose>
	    	</c:forEach>
	    </div>
	  </div>
	  <!-- 多选题答案列表  -->
	  <div class="layui-form-item checkbox">
	    <label class="layui-form-label">正确答案</label>
	    <div class="layui-input-block" id="multiOption">
	    	<c:forEach var="select" items="${selectList }" varStatus="i">
	    		<c:choose>
	    			<c:when test="${select.label == allAnswer[i.index].answerSelect and allAnswer[i.index].isAnswerTrue == 1 }">
	    				<input type="checkbox" name="isAnswerTrue2" data-index="${i.index }" value="${select.id }" title="${select.label }" checked="checked">	
	    			</c:when>
	    			<c:otherwise>
	    				<input type="checkbox" name="isAnswerTrue2" data-index="${i.index }" value="${select.id }" title="${select.label }">
	    			</c:otherwise>
	    		</c:choose>
	    	</c:forEach>
	    </div>
	  </div>
	  <%-- 判断题答案列表 --%>
	  <div class="layui-form-item answerJudge" pane="">
	    <label class="layui-form-label">正确答案</label>
	    <div class="layui-input-block"  id="judgeOption">
	    	<c:forEach var="select" items="${trueOrFalse }" varStatus="i">
	    		<c:choose>
	    			<c:when test="${select.label == allAnswer[i.index].answerSelect and allAnswer[i.index].isAnswerTrue == 1 }">
	    				<input type="radio" name="isAnswerTrue3" data-index="${i.index }" value="${select.id }" title="${select.label }" checked="checked">	
	    			</c:when>
	    			<c:otherwise>
	    				<input type="radio" name="isAnswerTrue3" data-index="${i.index }" value="${select.id }" title="${select.label }">
	    			</c:otherwise>
	    		</c:choose>
	    	</c:forEach>
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">试题解析</label>
	    <div class="layui-input-block">
	      <textarea placeholder="请输入解析" name="remark" class="layui-textarea">${question.remark}</textarea>
	    </div>
	  </div>
	  <div class="layui-form-item" align="center">
	      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
  	</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.extend({
        admin: '{/}${pageContext.request.contextPath}/WeAdmin/static/js/admin'
    });
    layui.use(['form','layer','jquery'], function(){
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;
        form.render();
        //自定义验证规则
        form.verify({
            nikename: function(value){
                if(value.length < 5){
                    return '昵称至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
        });
        
        //页面一加载就隐藏答案
        $(function(){
            answerHide();
            var type = ${question.questionType};
            if(type == 1){
            	$(".answer").show();
            	$(".radio").show();
            } else if (type == 2) {
            	$(".answer").show();
            	$(".checkbox").show();
            } else if (type == 3) {
            	$(".answerJudge").show();
            } else {
                return;
            }
        	
        })

        function answerHide(){
        	$(".answer").hide();
            $(".answerJudge").hide().val();
            $(".radio").hide().val();
            $(".checkbox").hide().val();
        }
        
		form.on('radio(questionType)', function (data) {  
			if (data.value == 1){
				answerHide();
				$(".answer").show();
				$(".radio").show();
				if($('input[name=isAnswerTrue1]:checked').length > 1 || $('input[name=isAnswerTrue2]:checked').length > 1){
					$('input[name=isAnswerTrue1]').prop('checked', false);
					form.render('radio');
				}
			} else if (data.value == 2){
				answerHide();
				$(".answer").show();
				$(".checkbox").show();
			} else if (data.value == 3) {
				answerHide();
				$(".answerJudge").show();
				if($('input[name=isAnswerTrue3]:checked').length > 1){
					$('input[name=isAnswerTrue3]').prop('checked', false);
					form.render('radio');
				}
			} else {
				return;
			}
        });
        //根据选择题目类型，改变答案
       form.on('select(categoryParent)',function(data){
        	$.ajax({
            	url: "${pageContext.request.contextPath}/question/getCategoryByParentId",
        		type: "post",
        		dataType: "json",
        		data: "parentId="+data.value,
        		success: function(result){
            		if (result.status == 1){
                		console.info();
                		$("#questionCategory").empty();
                		 $("#questionCategory").append("<option value=''>--请选择二级类别--</option>");
                		 if(result.data != null){
                			 for(var i in result.data){
                         		$("#questionCategory").append("<option value='"+result.data[i].id+"'>"+result.data[i].categoryName+"</option>");
                         	}	 
                    	 }
                		 form.render();
                	}
            	}
            })    
        })
		form.on('submit(demo1)', function(data){
			var questionType = data.field.questionType;
			var questionContent = data.field.questionContent;
			var questionCategory = data.field.questionCategory;
			var questionScore = data.field.questionScore;
			var remark = data.field.remark;
			if(data.field.questionCategory == null || data.field.questionCategory == ''){
				layer.alert("您还未选中试题二级类别");
				return false;
			}
			if(data.field.questionType == null || data.field.questionType == ''){
				layer.alert("您还未选中试题类型");
				return false;
			}
			if(data.field.questionScore == null || data.field.questionScore == '' || data.field.questionScore < 1){
				layer.alert("试题分值有误!");
				return false;
			}
			if(data.field.questionContent == null || data.field.questionContent == ''){
				layer.alert("您还未填写题目内容");
				return false;
			}
			if (questionType == 1){
				//获取到选中的下标
				var answerContent = $("input[name = 'answerContent']");
				for(var i=0; i<answerContent.length; i++){
					if(answerContent[i].value == null || answerContent[i].value == ''){
						layer.alert("您还未填写完所有答案！");
						return false;
					}
				}
				var checked = $("#oneOption input[name='isAnswerTrue1']:checked").attr("data-index");
				if(checked == null || checked == ''){
					layer.alert("您还未选中正确答案！");
					return false;
				}
				var answerSelect = $("#oneOption input[name='isAnswerTrue1']")
				var answerArr = new Array();
				var answerSelects = new Array();
				for(var i=0; i<answerContent.length; i++){
					answerArr.push(answerContent[i].value);
					answerSelects.push(answerSelect[i].value);
				}
				 $.ajax({
					url: "${pageContext.request.contextPath}/question/updateOneSelectQuestion",
					type: "POST",
					data: "id="+'${question.id}'+"&questionContent="+questionContent+"&questionCategory="+questionCategory+"&questionType="+questionType+"&remark="+remark+"&questionScore="+questionScore+"&answerContents="+answerArr+"&checked="+checked+"&answerSelects="+answerSelects,
					dataType: "json",
					success: function(result) {
						if(result.status == 1){
							layer.alert("编辑成功！",function(){
								parent.layer.closeAll();
	                            parent.location.reload();
							});
						}
					}
				});
			} else if(questionType == 2) {
				var answerContent = $("input[name = 'answerContent']");
				for(var i=0; i<answerContent.length; i++){
					if(answerContent[i].value == null || answerContent[i].value == ''){
						layer.alert("您还未填写完所有答案！");
						return false;
					}
				}
				var answerArr = new Array();
				
				//获取所有复选选中的
				var checked = new Array();
				var multiOption = $("#multiOption input[name = 'isAnswerTrue2']:checked");
				if(multiOption.length < 1){
					layer.alert("您还未选中正确答案！");
					return false;
				}
				var answerSelect = $("#multiOption input[name = 'isAnswerTrue2']");
				//获取到所有答案
				var answerSelects = new Array();
				multiOption.each(function(){
					//得到所有正确答案的索引
					checked.push($(this).attr("data-index"));
				})
				
				for(var i=0;i<answerContent.length;i++){
					answerArr.push(answerContent[i].value);
					answerSelects.push(answerSelect[i].value);
				}
				$.ajax({
					url: "${pageContext.request.contextPath}/question/updateMultiQuestion",
					type: "POST",
					dataType: "json",
					data: "id="+'${question.id}'+"&questionContent="+questionContent+"&questionCategory="+questionCategory+"&questionType="+questionType+"&remark="+remark+"&questionScore="+questionScore+"&answerContents="+answerArr+"&checked="+checked+"&answerSelects="+answerSelects,
					success: function(result){
						if(result.status == 1){
							layer.alert("编辑成功！",function(){
								parent.layer.closeAll();
	                            parent.location.reload();
							});
						}
					}
				})
			} else if (questionType == 3) {
				//获取到正确答案的索引
				var judgeOptionChecked = $("#judgeOption input[name='isAnswerTrue3']:checked");
				if(judgeOptionChecked.length < 1){
					layer.alert("您还未选中正确答案！");
					return false;
				}
				var dataIndex = judgeOptionChecked[0].getAttribute("data-index");
				var judgeOption =  $("#judgeOption input[name = 'isAnswerTrue3']");
				var answerCount = judgeOption.length;
				var answerSelect = new Array();
				for(var i = 0; i < answerCount; i++){
					answerSelect.push(judgeOption[i].value);
				}				
				$.ajax({
					url: "${pageContext.request.contextPath}/question/updateJudgeQuestion",
					type: "post",
					data: "id="+'${question.id}'+"&questionContent="+questionContent+"&questionCategory="+questionCategory+"&questionType="+questionType+"&remark="+remark+"&questionScore="+questionScore+"&answerCount="+answerCount+"&dataIndex="+dataIndex+"&answerSelects="+answerSelect,
					dataType: "json",
					success: function(result){
						if(result.status == 1){
							layer.alert("编辑成功！",function(){
								parent.layer.closeAll();
	                            parent.location.reload();
							});
						}
					}
				})
			}
		    return false;
		  });
    });
</script>
</body>

</html>
