<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="test/admin1.css">
<title>管理员后台中心</title>
<script type="text/javascript">
	function getDtName() {
		var href="<%=basePath%>APIServlet?method=accessdtables";
		window.location.href=href;
	}
	function getCId() {
		var href="<%=basePath%>/appCateServlet?method=listallu";
		window.location.href=href;
	}
</script>
</head>
<body>
	<form action="<%=basePath%>apps/addnewapp" method="post">
		<center>
			<table width="98%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
			<tr class="tr_title">
				<td>数据服务id</td>
				<td>数据服务名称</td>
				<td>数据服务种类</td>
				<td>数据服务描述</td>
<!-- 				<td>api接口地址</td> -->
				<td>app连接数量</td>
				<td>数据服务状态</td>
				<td>操作</td>
			</tr>
			<c:forEach var="anapp" items="${allbadapps}">
				<tr class="tr_content">
					<td>${anapp.id}</td>
					<td>${anapp.name}</td>
					<td>${anapp.appcategory}</td>
					<td>${anapp.description}</td>
<%-- 					<td>${anapp.apiaddress}</td> --%>
					<td>${anapp.num}</td>
					<td>不正常</td>
					<td><a href="<%=basePath%>apps/id/deleteById/${anapp.id}">删除</a>&nbsp;&nbsp;<a href="<%=basePath%>apps/id/setnormal/${anapp.id}">设置为可用</a></td>
				</tr>
			</c:forEach>
		</table>
		</center>
	</form>
</body>
</html>