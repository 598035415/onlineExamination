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
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="weadmin-body">
	<form class="layui-form layui-form-pane" action="">
	  <div class="layui-form-item">
	    <label class="layui-form-label">试题类别</label>
	    <div class="layui-input-inline">
	      <select name="quiz1" lay-filter="categoryParent">
	        <option value="">--请选择一级类别--</option>
	        <c:forEach var="categoryParentList" items="${categoryParentList.data}">
	        		<option value="${categoryParentList.id }">${categoryParentList.categoryName }</option>
	        </c:forEach>
	      </select>
	    </div>
	    <div class="layui-input-inline">
	      <select name="questionCategory" id="questionCategory">
	        <option value="6555">--请选择二级类别--</option>
	        	 <!-- <option value="温州">温州</option> -->
	        <!-- <option value="杭州">杭州</option>
	        <option value="宁波" disabled="">宁波</option>
	        <option value="温州">温州</option>
	        <option value="温州">台州</option>
	        <option value="温州">绍兴</option> -->
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item" pane="">
	    <label class="layui-form-label">选择类型</label>
	    <div class="layui-input-block">
	    	<c:forEach var="type" items="${typeList}">
	    		<input id="questionType" type="radio" name="questionType" value="${type.id}" title="${type.label}" lay-filter="questionType">
	    	</c:forEach>
	      <!-- <input type="radio" name="questionType" value="禁" title="禁用" disabled=""> -->
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">试题内容</label>
	    <div class="layui-input-block">
	      <input type="text" name="questionContent" autocomplete="off" placeholder="请输入题目内容" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">试题分值</label>
	    <div class="layui-input-block">
	      <input type="number" name="questionScore" autocomplete="off" placeholder="请输入题目分值" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item answer" >
	    <label class="layui-form-label">A答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" autocomplete="off" placeholder="请输入A答案内容" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item answer">
	    <label class="layui-form-label">B答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" autocomplete="off" placeholder="请输入B答案内容" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item answer">
	    <label class="layui-form-label">C答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" autocomplete="off" placeholder="请输入C答案内容" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item answer">
	    <label class="layui-form-label">D答案</label>
	    <div class="layui-input-block">
	      <input type="text" name="answerContent" autocomplete="off" placeholder="请输入D答案内容" class="layui-input">
	    </div>
	  </div>
	  <!-- 单选题答案列表-->
	  <div class="layui-form-item radio" pane="">
	    <label class="layui-form-label">正确答案</label>
	    <div class="layui-input-block">
	    	<c:forEach var="select" items="${selectList }">
	    		<input type="radio" name="isAnswerTrue" value="${select.id }" title="${select.label }">
	    	</c:forEach>
	    </div>
	  </div>
	  <!-- 多选题答案列表  -->
	  <div class="layui-form-item checkbox">
	    <label class="layui-form-label">正确答案</label>
	    <div class="layui-input-block">
	    	<c:forEach var="select" items="${selectList }">
	    		<input type="checkbox" name="isAnswerTrue" value="${select.id }" title="${select.label }">
	    	</c:forEach>
	    </div>
	  </div>
	  <%-- 判断题答案列表 --%>
	  <div class="layui-form-item answerJudge" pane="">
	    <label class="layui-form-label">正确答案</label>
	    <div class="layui-input-block">
	    	<c:forEach var="select" items="${trueOrFalse }">
	    		<input type="radio" name="isAnswerTrue" value="${select.id }" title="${select.label }">
	    	</c:forEach>
	    </div>
	  </div>
	  <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <textarea placeholder="请输入备注" name="remark" class="layui-textarea"></textarea>
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
        //根据选择题目类型，改变答案
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
                    		console.info(result.data[i]);
                    		$("#questionCategory").append("<option value='"+result.data[i].id+"'>"+result.data[i].categoryName+"</option>");
                    		form.render();
                    	}
                	}
            	}
            })    
        })
		form.on('submit(demo1)', function(data){
			console.info($("input[name = 'answerContent']").val());
			console.info("----"+data);
		    layer.alert(JSON.stringify(data.field), {
		      title: '最终的提交信息'
		    })
		    return false;
		  });
    });
</script>
</body>

</html>
