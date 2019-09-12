<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>试卷管理</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/lib/layui/css/layui.css"  media="all">
</head>

<body>
<div class="weadmin-body">
    <div class="weadmin-block">
        <button class="layui-btn" onclick="WeAdminShow('添加试卷', '${pageContext.request.contextPath}/examPaper/toAddExamPaperPage',700,570)">
            <i class="layui-icon layui-icon-add-circle-fine"></i>添加
        </button>
        <button type="button" class="layui-btn layui-btn-normal" onclick="updateExamPaper('编辑','${pageContext.request.contextPath}/examPaper/toUpdateExamPaperPage',700,570)">
        	<i class="layui-icon layui-icon-util"></i>编辑
        </button>
        <button class="layui-btn layui-btn-danger" onclick="delAllExam()">
            <i class="layui-icon layui-icon-delete"></i>批量删除
        </button>
        <span class="fr" style="line-height:40px">共有数据：${examPaperList.total} 条</span>
    </div>
    <table class="layui-table" id="memberList">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary">
                    <i class="layui-icon">&#xe605;</i>
                </div>
            </th>
            <th>试卷ID</th>
            <th>试卷名</th>
            <th>试卷类型</th>
            <th>试卷总分</th>
            <!-- <th>合格分</th> -->
            <th>状态</th>
            <th>创建时间</th>
            <!-- <th>更新时间</th> -->
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="examPaper" items="${examPaperList.list}" varStatus="i">
                <tr data-id="${i.index}">
                    <td>
                		<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="${examPaper.id}">
                            <i class="layui-icon">&#xe605;</i>
                        </div>
                    </td>
                    <td>${examPaper.id}</td>
                    <td>${examPaper.examPaperTitle}</td>
                    <td>${examPaper.examPaperType}</td>
                    <td>${examPaper.examPaperTotalScroe}</td>
                    <%-- <td>${examPaper.qualifiedPoints}</td> --%>
                    <td width="180px;">
	                    <form class="layui-form" action="" lay-filter="example">
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <c:choose>
                                        <c:when test="${examPaper.status == 1}">
                                            <input type="checkbox" checked="checked" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="正常|已删除" value="${examPaper.id}">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="checkbox" name="close" lay-skin="switch" lay-filter="switchTest" lay-text="正常|已删除" value="${examPaper.id}">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </form>
                    </td>
                    <td>
                        <fmt:formatDate value="${examPaper.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <%-- <td>
                        <fmt:formatDate value="${examPaper.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td> --%>
                    <td class="td-manage">
                    	<button type="button" class="layui-btn" onclick="WeAdminInfo('试卷详情', '${pageContext.request.contextPath}/task/exam/detailpage?examId=${examPaper.id}','${examPaper.id}',700,570)">试卷详情</button>
                    </td>
                </tr>
            </c:forEach>
            
        </tbody>
    </table>
    <div id="demo1"></div>
</div>
<script src="${pageContext.request.contextPath}/WeAdmin/lib/layui/layui.all.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/WeAdmin/static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'jquery', 'laypage','layer'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,$ = layui.jquery
            ,laypage = layui.laypage
            ,layer = layui.layer;

        laypage.render({
            elem: 'demo1'
          });
        //监听指定开关
        form.on('switch(switchTest)', function(data){
            var status = this.checked ? 1 : 2;
            var id = this.value;
            $.ajax({
                url: "${pageContext.request.contextPath}/examPaper/updateExamPaperStatus",
                type: "post",
                data: "id="+id+"&status="+status,
                dataType: "json",
                success: function (result) {
                    if (result.status == 1){
                        layer.alert("更新成功~",function () {
                            parent.layer.closeAll();
                            parent.location.reload();
                        });
                    } else {
                        layer.alert(result.msg);
                    }
                }
            })
        });
    });
</script>
</body>
</html>

