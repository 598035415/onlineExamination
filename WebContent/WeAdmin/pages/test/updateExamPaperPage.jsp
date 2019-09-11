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
	    <label class="layui-form-label">试卷类别</label>
	    <div class="layui-input-inline">
	      <select lay-filter="categoryParent">
	        <option value="">--请选择一级类别--</option>
	        <c:forEach var="categoryParentList" items="${categoryParentList.data}">
	        	<c:choose>
	        		<c:when test="${categoryParentList.id == examPaperInfoList[0].parentId}">
	        			<option value="${categoryParentList.id }" selected="selected">${categoryParentList.categoryName }</option>
	        		</c:when>
	        		<c:otherwise>
	        			<option value="${categoryParentList.id }">${categoryParentList.categoryName }</option>
	        		</c:otherwise>
	        	</c:choose>
	        </c:forEach>
	      </select>
	    </div>
	    <div class="layui-input-inline">
	      <select name="examPaperType" id="examPaperType">
	        <option value="">--请选择二级类别--</option>
	        <c:forEach var="category" items="${allSonCategory.data }">
	        	<c:choose>
	        		<c:when test="${category.id == examPaperInfoList[0].examPaperType }">
	        			<option value="${category.id }" selected="selected">${category.categoryName }</option>
	        		</c:when>
	        		<c:otherwise>
	        			<option value="${category.id }">${category.categoryName }</option>
	        		</c:otherwise>
	        	</c:choose>
	        </c:forEach>
	      </select>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">试卷名</label>
	    <div class="layui-input-block">
	      <input type="text" name="examPaperTitle" autocomplete="off" placeholder="请输入试卷名称" class="layui-input" value="${examPaperInfoList[0].examPaperTitle }">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">试卷总分</label>
	    <div class="layui-input-block">
	      <input type="number" name="examPaperTotalScroe" autocomplete="off" placeholder="请输入题目分值" class="layui-input" value="${examPaperInfoList[0].examPaperTotalScroe }">
	    </div>
	  </div>
	  <%-- <div class="layui-form-item">
	    <label class="layui-form-label">合格分</label>
	    <div class="layui-input-block">
	      <input type="number" name="qualifiedPoints" autocomplete="off" placeholder="请输入题目分值" class="layui-input" value="${examPaperInfoList[0].qualifiedPoints }">
	    </div>
	  </div> --%>
	  <div class="layui-form-item">
	  	<div id="test4" class="demo-transfer"></div>
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
    layui.use(['form','layer','jquery','transfer','util'], function(){
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery,
            transfer = layui.transfer,
            util = layui.util;
        
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

        var data1 = new Array();

        <c:forEach items="${questionList}" var="question">
        	var question = {"value":"${question.id}","title":"${question.questionContent}"};
        	data1.push(question);
        </c:forEach>

      //显示搜索框
        transfer.render({
          elem: '#test4'
          ,data: data1
          ,title: ['试题列表', '已选试题']
          ,showSearch: true
          ,width:650
          ,height:490
          ,id: 'question'
        })
        
        //根据选择题目类型，改变二级类型
       form.on('select(categoryParent)',function(data){
        	$.ajax({
            	url: "${pageContext.request.contextPath}/question/getCategoryByParentId",
        		type: "post",
        		dataType: "json",
        		data: "parentId="+data.value,
        		success: function(result){
            		if (result.status == 1){
                		$("#examPaperType").empty();
                		$("#examPaperType").append("<option value=''>--请选择二级类别--</option>");
                		if(result.data != null){
                			for(var i in result.data){
                        		$("#examPaperType").append("<option value='"+result.data[i].id+"'>"+result.data[i].categoryName+"</option>");
                        	}	
                		}
                		form.render();
                	}
            	}
            })    
        })
		form.on('submit(demo1)', function(data){
			var examPaperType = data.field.examPaperType;
			var examPaperTitle = data.field.examPaperTitle;
			var examPaperTotalScroe = data.field.examPaperTotalScroe;
			var qualifiedPoints = data.field.qualifiedPoints;
			//获取到所有选中试题
			var questionArr = transfer.getData('question');
			//用来存储所有选中的试题的ID
			var questionIdArr = new Array();
			for(var i in questionArr) {
				questionIdArr.push(questionArr[i].value);
			}
			$.ajax({
				url: "${pageContext.request.contextPath}/examPaper/addExamPaper",
				type: "post",
				data: "examPaperType="+examPaperType+"&examPaperTitle="+examPaperTitle+"&examPaperTotalScroe="+examPaperTotalScroe+"&qualifiedPoints="+qualifiedPoints+"&questionIdArr="+questionIdArr,
				dataType: "",
				success: function(result){
					if (result.status == 1){
                        layer.alert("添加成功~",function () {
                            parent.layer.closeAll();
                            parent.location.reload();
                        });
					}
				}
			})
		    return false;
		});
    });
</script>
</body>

</html>
