<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="test/admin1.css">
<title>管理员后台中心</title>
</head>
<body>
	<center>
		<table width="50%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
			<tr class="tr_title">
				<td>用户名</td><td>${user.username}</td></tr>
				<tr class="tr_title">
				<td>邮箱</td><td>${user.emailAddress}</td></tr>
				<tr class="tr_title">
				<td>姓名</td><td>${user.lastname}${user.firstname}</td></tr>
				<tr class="tr_title">
				<td>公司</td><td>${user.companyName}</td></tr>
				<tr class="tr_title">
				<td>注册时间</td><td>${user.regdate}</td></tr>
				<tr class="tr_title">
				<td>用戶状态</td><td>${user.isDel==0?"正常":"黑名单"}</td></tr>
				<tr class="tr_title">
				<td>用戶等级</td><td>Lv${user.ulevelid}</td></tr>
		</table>
		
	</center>
</body>
</html>