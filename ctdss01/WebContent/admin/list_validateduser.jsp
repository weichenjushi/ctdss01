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
		<table width="98%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
			<tr class="tr_title">
				<td>用户名</td>
				<td>邮箱</td>
				<td>姓名</td>
				<td>公司</td>
				<td>注册时间</td>
				<td>用戶状态</td>
				<td>用戶等级</td>
				<td>操作</td>
			</tr>
			<c:forEach var="user" items="${validatedusers}">
				<tr class="tr_content">
					<td>${user.username}</td>
					<td>${user.emailAddress}</td>
					<td>${user.name}</td>
					<td>${user.companyName}</td>
					<td>${user.regdate}</td>
					<td>正常</td>
					<td>Lv${user.ulevelid}</td>
					<td>
					<a href="userServlet?method=editlevelById&uid=${user.userid}&uname=${user.username}">修改用户等级</a>&nbsp;
					<a href="userServlet?method=delById&id=${user.userid}">加入黑名单</a>
					</td>
				</tr>
			</c:forEach>
			 	<tr class="tr_content">
          				<td colspan="8" height="40" class="appPages"><a>首页</a><a>上一页</a><a>下一页</a><a>最后一页</a></td>
         		  </tr>
		</table>
		
	</center>
</body>
</html>