<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员后台中心</title>
<link rel="stylesheet" type="text/css" href="test/admin1.css">
</head>
<body>
	<center>
		<table width="98%" border="0" cellspacing="0" cellpadding="0" class="bg_tb">
			<tr class="tr_title">
				<td>用户名</td>
				<td>邮箱</td>
				<td>姓名</td>
				<td>公司</td>
				<td>注册时间</td>
				<td>用戶状态</td>
				
			</tr>
			<c:forEach var="user" items="${unactivatedusers}">
				<tr class="tr_content">
					<td>${user.username}</td>
					<td>${user.emailAddress}</td>
					<td>${user.name}</td>
					<td>${user.companyName}</td>
					<td>${user.regdate}</td>
					<td>未激活</td>
				
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>