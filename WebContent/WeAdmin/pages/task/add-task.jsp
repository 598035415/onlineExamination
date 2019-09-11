<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>发布考试任务</title>
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
	        <option value="">--请选择一级类别--</option>
	        <option value="">--请选择一级类别--</option>
	        <option value="">--请选择一级类别--</option>
	      </select>
	    </div>
	    <div class="layui-input-inline">
	      <select name="questionCategory" id="questionCategory">
	        <option value="">--请选择二级类别--</option>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item" pane="">
	    <label class="layui-form-label">选择类型</label>
	    <div class="layui-input-block">
	    	<c:forEach var="type" items="${typeList}">
	    		<input id="questionType" type="radio" name="questionType" value="${type.id}" title="${type.label}" lay-filter="questionType">
	    	</c:forEach>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">试题分值</label>
	    <div class="layui-input-block">
	      <input type="number" name="questionScore" autocomplete="off" placeholder="请输入题目分值" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">试题内容</label>
	    <div class="layui-input-block">
	      <input type="text" name="questionContent" autocomplete="off" placeholder="请输入题目内容" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item answer" >
	    <label class="layui-form-label">A答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" answer-select="A" autocomplete="off" placeholder="请输入A答案内容" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item answer">
	    <label class="layui-form-label">B答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" answer-select="B" autocomplete="off" placeholder="请输入B答案内容" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item answer">
	    <label class="layui-form-label">C答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" answer-select="C" autocomplete="off" placeholder="请输入C答案内容" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item answer">
	    <label class="layui-form-label">D答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" answer-select="D" autocomplete="off" placeholder="请输入D答案内容" class="layui-input">
	    </div>
	  </div>
	  <!-- 单选题答案列表-->
	  <div class="layui-form-item radio">
	    <label class="layui-form-label">正确答案</label>
	    <div class="layui-input-block" id="oneOption">
	    	<c:forEach var="select" items="${selectList }" varStatus="i">
	    		<input type="radio" name="isAnswerTrue" data-index="${i.index }" value="${select.id }" title="${select.label }">
	    	</c:forEach>
	    </div>
	  </div>
	  <!-- 多选题答案列表  -->
	  <div class="layui-form-item checkbox">
	    <label class="layui-form-label">正确答案</label>
	    <div class="layui-input-block" id="multiOption">
	    	<c:forEach var="select" items="${selectList }" varStatus="i">
	    		<input type="checkbox" name="isAnswerTrue" data-index="${i.index }" value="${select.id }" title="${select.label }">
	    	</c:forEach>
	    </div>
	  </div>
	  <%-- 判断题答案列表 --%>
	  <div class="layui-form-item answerJudge" pane="">
	    <label class="layui-form-label">正确答案</label>
	    <div class="layui-input-block"  id="judgeOption">
	    	<c:forEach var="select" items="${trueOrFalse }" varStatus="i">
	    		<input type="radio" name="isAnswerTrue" data-index="${i.index }" value="${select.id }" title="${select.label }">
	    	</c:forEach>
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">试题解析</label>
	    <div class="layui-input-block">
	      <textarea placeholder="请输入解析" name="remark" class="layui-textarea"></textarea>
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
			} else if (data.value == 2){
				answerHide();
				$(".answer").show();
				$(".checkbox").show();
			} else if (data.value == 3) {
				answerHide();
				$(".answerJudge").show();
			} else {
				return;
			}
        });
        //根据选择题目类型，改变二级类型
       form.on('select(categoryParent)',function(data){
        	$.ajax({
            	url: "${pageContext.request.contextPath}/question/getCategoryByParentId",
        		type: "post",
        		dataType: "json",
        		data: "parentId="+data.value,
        		success: function(result){
            		if (result.status == 1){
                		$("#questionCategory").empty();
                		$("#questionCategory").append("<option value=''>--请选择二级类别--</option>");
                		for(var i in result.data){
                    		$("#questionCategory").append("<option value='"+result.data[i].id+"'>"+result.data[i].categoryName+"</option>");
                    		form.render();
                    	}
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
			if (questionType == 1){
				//获取到选中的下标
				var answerContent = $("input[name = 'answerContent']");
				var checked = $("#oneOption input[name='isAnswerTrue']:checked").attr("data-index");
				var answerSelect = $("#oneOption input[name='isAnswerTrue']")
				var answerArr = new Array();
				var answerSelects = new Array();
				for(var i=0; i<answerContent.length; i++){
					answerArr.push(answerContent[i].value);
					answerSelects.push(answerSelect[i].value);
				}
				 $.ajax({
					url: "${pageContext.request.contextPath}/question/addQuestion",
					type: "POST",
					data: "questionContent="+questionContent+"&questionCategory="+questionCategory+"&questionType="+questionType+"&remark="+remark+"&questionScore="+questionScore+"&answerContents="+answerArr+"&checked="+checked+"&answerSelects="+answerSelects,
					dataType: "json",
					success: function(result) {
						if(result.status == 1){
							layer.alert("添加成功！",function(){
								parent.layer.closeAll();
	                            parent.location.reload();
							});
						}
					}
				}); 
			} else if(questionType == 2) {
				var answerContent = $("input[name = 'answerContent']");
				var answerArr = new Array();
				
				//获取所有复选选中的
				var checked = new Array();
				var multiOption = $("#multiOption input[name = 'isAnswerTrue']:checked");

				var answerSelect = $("#multiOption input[name = 'isAnswerTrue']");
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
					url: "${pageContext.request.contextPath}/question/addMultiQuestion",
					type: "POST",
					dataType: "json",
					data: "questionContent="+questionContent+"&questionCategory="+questionCategory+"&questionType="+questionType+"&remark="+remark+"&questionScore="+questionScore+"&answerContents="+answerArr+"&checked="+checked+"&answerSelects="+answerSelects,
					success: function(result){
						if(result.status == 1){
							layer.alert("添加成功！",function(){
								parent.layer.closeAll();
	                            parent.location.reload();
							});
						}
					}
				})
			} else if (questionType == 3) {
				//获取到正确答案的索引
				var judgeOption = $("#judgeOption input[name='isAnswerTrue']:checked");
				var answerCount =  $("#judgeOption input[name = 'isAnswerTrue']").length;
				var dataIndex = judgeOption[0].getAttribute("data-index");
				var answerSelect = judgeOption[0].value;
				$.ajax({
					url: "${pageContext.request.contextPath}/question/addJudgeQuestion",
					type: "post",
					data: "questionContent="+questionContent+"&questionCategory="+questionCategory+"&questionType="+questionType+"&remark="+remark+"&questionScore="+questionScore+"&judgeOption="+answerSelect+"&answerCount="+answerCount+"&dataIndex="+dataIndex,
					dataType: "json",
					success: function(result){
						if(result.status == 1){
							layer.alert("添加成功！",function(){
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
