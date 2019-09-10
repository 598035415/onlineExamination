<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>发布任务</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css">
  	<style type="text/css">
  		#zhexiantu{
  			width: 900px;
  			height: 400px;
  		}
  	</style>
  </head>
  
  <body>
    <div class="weadmin-body">
        <form class="layui-form">
		  <div class="layui-form-item">
		    <label class="layui-form-label">选择试卷</label>
		    <div class="layui-input-block" style="width: 200px;">
		      <select name="examId"  lay-filter="layNianfen" id="exam" lay-verify="examId">
		    	<option value="0">请选择</option>
		        <c:forEach items="${selectTaskList}" var="paperList">
		        	<option value="${paperList.id }">${paperList.examPaperTitle}</option>
		        </c:forEach>
		      </select>
		    </div>
		  </div>
		  <div id="zhexiantu" ></div>
      </form>
    </div>
    <script src="${pageContext.request.contextPath}/WeAdmin/static/echarts.min.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.js" charset="utf-8"></script>
	<%--  <script src="${pageContext.request.contextPath}/WeAdmin/static/js/jquery.js" charset="utf-8"></script> --%>
   	<script type="text/javascript" src=""></script>
    <script type="text/javascript">
    layui.use(['form','jquery'],function(){
    	var form =layui.form,
    			$=layui.jquery;
	    form.on('select(layNianfen)', function(data){
	    	 var nianfen = data.value;
	    	 alert(nianfen);
	    	 $.ajax({
	    		 url:"${pageContext.request.contextPath}/selectPerformance",
	    		 data:"tackId="+nianfen,
	    		 type:"get",
	    		 dataType:"JSON",
	    		 success:function(result){
	    			 if(result==null){
	    				 return;
	    			 }
	    			 var name=new Array();
	    			 var score=new Array();
	    			 for (var i = 0; i < result.length; i++) {
						name[i]=result[i].username;
						score[i]=result[i].score;
					}
	    			 console.info(name);
	    			 console.info(score);
	    			 
	    			 
	    			 var option = {
	    			    	    title: {
	    			    	        text: '学生成绩折线图'
	    			    	    },
	    			    	    tooltip: {
	    			    	        trigger: 'axis'
	    			    	    },
	    			    	    legend: {
	    			    	        data:['邮件营销']
	    			    	    },
	    			    	    grid: {
	    			    	        left: '3%',
	    			    	        right: '4%',
	    			    	        bottom: '3%',
	    			    	        containLabel: true
	    			    	    },
	    			    	    toolbox: {
	    			    	        feature: {
	    			    	            saveAsImage: {}
	    			    	        }
	    			    	    },
	    			    	    xAxis: {
	    			    	        type: 'category',
	    			    	        boundaryGap: false,
	    			    	        data: name
	    			    	    },
	    			    	    yAxis: {
	    			    	        type: 'value'
	    			    	    },
	    			    	    series: [
	    			    	        {
	    			    	            name:'1',
	    			    	            type:'line',
	    			    	            stack: '总量',
	    			    	            data:score
	    			    	        },
	    			    	    ]
	    			    	};
	    			    	 var myChart = echarts.init(document.getElementById('zhexiantu'));
	    			    	 myChart.setOption(option);
	    			    	 
	    			    	 
	    			    	 
	    			    	 
	    			    	 
	    			    	 
	    			    	 
	    			    	 
	    			    	 
	    			    	 
	    		 }
	    	 })
	    	/*   console.log(data.elem); //得到select原始DOM对象
	    	  console.log(data.value); //得到被选中的值
	    	  console.log(data.othis); //得到美化后的DOM对象 */
	    });  
    })
     
    </script>
    <script type="text/javascript">
    layui.extend({
		admin: '{/}${pageContext.request.contextPath}/WeAdmin/static/js/admin'
	});
    layui.use(['form','jquery','layer','admin'], function(){
      var form = layui.form,
      	admin = layui.admin,
      	layer = layui.layer;
      	$=layui.jquery;
      	form.render();
    
      //监听提交
      form.on('submit(add)', function(data){
         $.ajax({
        	 url:"${pageContext.request.contextPath}",
        	 data:$(".layui-form").serialize(),
        	 type:"post",
        	 dataType:"JSON",
        	 success:function(result){
        		 console.info(result)
        		 if(result.status===1){
		            layer.msg("增加成功", {icon: 6,time:1000},function () {
		                // 获得frame索引
		                var index = parent.layer.getFrameIndex(window.name);
		                //关闭当前frame
		                parent.layer.close(index);
		                window.parent.location.reload()
		            });
        		 }else{
        			 layer.msg("增加失败", {icon: 5,time:1000});
        		 }
        	 }
         })
        //发异步，把数据提交给php
        return false;
      });
    });
    </script>
  </body>

</html>