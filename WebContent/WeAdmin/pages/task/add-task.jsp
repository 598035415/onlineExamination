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
	<form class="layui-form layui-form-pane" action="javascript:void(0)">
	  <div class="layui-form-item">
	    <label class="layui-form-label"><span style="color: red;">*</span> 发布班级</label>
	    <div class="layui-input-inline">
	      <select lay-filter="clazzId" name="clazzId">
        	<option value="">请选择班级</option>
	        <c:forEach items="${clazzList}" var="clazz">
	        	<option value="${clazz.id}">${clazz.clazzName}</option>
	        </c:forEach>
	      </select>
	    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label"><span style="color: red;">*</span> 选择试卷</label>
	    <div class="layui-input-inline">
	      <select lay-filter="examId" name="examId" >
        	<option value="">请选择试卷</option>
	        <c:forEach items="${examList}" var="exam">
	        	<option value="${exam.id}">${exam.examPaperTitle}</option>
	        </c:forEach>
	      </select>
	    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label"><span style="color: red;">*</span> 开考时间</label>
	    <div class="layui-input-inline">
        	<input type="text" class="layui-input" id="test5" readonly="readonly" autocomplete="off" placeholder="yyyy-MM-dd HH:mm:ss">
      	</div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label"><span style="color: red;">*</span> 结束时间</label>
	    <div class="layui-input-inline">
        	<input type="text" class="layui-input" id="test6" readonly="readonly" autocomplete="off" placeholder="yyyy-MM-dd HH:mm:ss">
      	</div>
	  </div>
	  
	  <div class="layui-form-item" >
	      <button class="layui-btn" id="publish" type="submit" lay-filter="demo1">发布</button>
  	</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    
    layui.extend({
        admin: '{/}${pageContext.request.contextPath}/WeAdmin/static/js/admin'
    });
    
    layui.use(['form','layer','jquery','laydate'], function(){
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery;
        var laydate = layui.laydate;
        //日期时间选择器
        laydate.render({
          elem: '#test5'
          ,type: 'datetime'
        });
        laydate.render({
          elem: '#test6'
          ,type: 'datetime'
        });
        
        form.render();
        var clazzId = '';
        form.on('select(clazzId)',function(data){
        	clazzId = data.value;
        })
        var examId ='';
        form.on('select(examId)',function(data){
        	examId  = data.value;
        })
        $("#publish").on("click",function(){
        	if(clazzId == ''){
        		layer.msg("未选择班级！");
        		return ;
        	}
        	if(examId == ''){
        		layer.msg("未选择试卷");
        		return ;
        	}
        	var startTime = $("#test5").val();
        	var endTime = $("#test6").val();
        	if(startTime == ''){
        		layer.msg("开考时间为必填项!");
        		return ;
        	}	
        	if(endTime == ''){
        		layer.msg("下考时间为必填项!");
        		return ;
        	}	
        	
        	var startTimeDate = new Date(Date.parse(startTime));
        	var endTimeDate = new Date(Date.parse(endTime));
        	if(startTimeDate > endTimeDate){
        		layer.msg("开考时间大于了结束时间");
        		return ;
        	}
			$.ajax({
				url:"${pageContext.request.contextPath}/task/save/publish"
				,type:"POST"
				,data:"clazzId="+clazzId+"&examId="+examId+"&startTime="+startTime+"&endTime="+endTime
				,success:function(result){
					if(result.status == 1){
						layer.alert(result.msg);
						setTimeout( function()  {
							parent.layer.closeAll();
                            parent.location.reload();
						}, 1200);
					}else{
						layer.msg(result.msg);
					}
				}
			}) 
        })
        
    });
</script>
</body>

</html>
