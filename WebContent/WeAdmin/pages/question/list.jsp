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
        <button class="layui-btn" onclick="WeAdminShow('添加试题', '${pageContext.request.contextPath}/question/toAddQuestionPage',570,770)">
            <i class="layui-icon layui-icon-add-circle-fine"></i>添加
        </button>
        <button type="button" class="layui-btn layui-btn-normal" onclick="updateQuestion('编辑','${pageContext.request.contextPath}/question/toUpdateQuestionPage',570, 770)">
        	<i class="layui-icon layui-icon-util"></i>编辑
        </button>
        <button class="layui-btn layui-btn-danger" onclick="delAllQuestion()">
            <i class="layui-icon layui-icon-delete"></i>批量删除
        </button>
        <span class="fr" style="line-height:40px">共有数据：${serverResponse.data.total} 条</span>
    </div>
    <table class="layui-table" id="memberList">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary">
                    <i class="layui-icon">&#xe605;</i>
                </div>
            </th>
            <th>试题ID</th>
            <th>试题标题</th>
            <th>试题类型</th>
            <th>试题分类</th>
            <th>试题分值</th>
            <!-- <th>备注</th> -->
            <th>状态</th>
            <th>创建时间</th>
            <th>更新时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="question" items="${serverResponse.data.list}" varStatus="i">
                <tr data-id="${i.index}">
                    <td>
                		<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="${question.id}">
                            <i class="layui-icon">&#xe605;</i>
                        </div>
                    </td>
                    <td>${question.id}</td>
                    <td>${question.questionContent}</td>
                    <td>${question.type}</td>
                    <td>${question.category}</td>
                    <td>${question.questionScore}</td>
                    <%-- <td>${question.remark}</td> --%>
                    <td>
                    	<c:choose>
                    		<c:when test="${question.status == 1}">
                    			正常
                    		</c:when>
                    		<c:otherwise>
                    			已删除
                    		</c:otherwise>
                    	</c:choose>
                    </td>
                    <td>
                        <fmt:formatDate value="${question.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <td>
                        <fmt:formatDate value="${question.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <td class="td-manage">
                    	<button type="button" class="layui-btn" onclick="WeAdminInfo('试题详情', '${pageContext.request.contextPath}/question/toQuestionInfo?id=${question.id}&lei=${question.category }','${question.id}',900,770)">试题详情</button>
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
            var status = this.checked ? 1 : 0;
            var id = this.value;
            $.ajax({
                url: "${pageContext.request.contextPath}/pages/member/updateMemberStatus",
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

