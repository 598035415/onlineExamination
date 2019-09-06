<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>试题管理</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/font.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/static/css/weadmin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/WeAdmin/lib/layui/css/layui.css"  media="all">
</head>

<body>
<%-- <div class="weadmin-nav">
			<span class="layui-breadcrumb">
				<a href="javascript:;">首页</a> <a href="javascript:;">管理员权限</a>
				<a href="javascript:;"> <cite>管理员列表</cite></a>
			</span>
    <a class="layui-btn layui-btn-sm" style="margin-top:3px;float:right" href="javascript:location.replace(location.href);"
       title="刷新">
        <i class="layui-icon layui-icon-refresh"></i>
    </a>
</div> --%>

<div class="weadmin-body">
    <div class="weadmin-block">
        <%--<button class="layui-btn layui-btn-danger" onclick="delAll()">
            <i class="layui-icon layui-icon-delete"></i>批量删除
        </button>--%>
        <button class="layui-btn" onclick="WeAdminShow('添加用户','${pageContext.request.contextPath}/pages/admin/toAdminAddPage',600,350)">
            <i class="layui-icon layui-icon-add-circle-fine"></i>添加
        </button>
        <span class="fr" style="line-height:40px">共有数据：${meberResponse.totalRecored} 条</span>
    </div>
    <table class="layui-table" id="memberList">
        <thead>
        <tr>
            <%--<th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary">
                    <i class="layui-icon">&#xe605;</i>
                </div>
            </th>--%>
            <th>试题ID</th>
            <th>试题标题</th>
            <th>试题类型</th>
            <th>试题分类</th>
            <th>试题分值</th>
            <th>备注</th>
            <th>状态</th>
            <th>创建时间</th>
            <th>更新时间</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="member" items="${meberResponse.beanList}" varStatus="i">
                <tr data-id="${i.index}">
                    <%--<td>
                        <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id="${member.id}">
                            <i class="layui-icon">&#xe605;</i>
                        </div>
                    </td>--%>
                    <td>${member.id}</td>
                    <td>${member.username}</td>
                    <td>
                        <form class="layui-form layui-form-pane" action="">
                            <div class="layui-form-item">
                                <div class="layui-input-inline">
                                    <select name="aclModuleId">
                                        <option value="0" selected="">--点击展开角色列表--</option>
                                        <c:forEach var="role" items="${member.roles}">
                                            <option>${role}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </td>
                    <td>
                        <fmt:formatDate value="${member.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <td>
                        <fmt:formatDate value="${member.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <td>${member.operateIp}</td>
                    <td>
                        <form class="layui-form" action="" lay-filter="example">
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <c:choose>
                                        <c:when test="${member.status == 1}">
                                            <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="启用|禁用" value="${member.id}">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="checkbox" name="close" lay-skin="switch" lay-filter="switchTest" lay-text="启用|禁用" value="${member.id}">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </form>
                    </td>
                    <td class="td-manage">
                        <a title="编辑" onclick="WeAdminEdit('编辑','./edit.html', 1, 600, 400)" href="javascript:;">
                            <i class="layui-icon layui-icon-edit"></i>
                        </a>
                        <a onclick="WeAdminShow('修改密码','./password.html',600,400)" title="修改密码" href="javascript:;">
                            <i class="layui-icon layui-icon-util"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div id="demo1"></div>
</div>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'jquery', 'laypage'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,$ = layui.jquery
            ,laypage = layui.laypage;

        laypage.render({
            elem: 'demo1'
            //,count: '${}'
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

