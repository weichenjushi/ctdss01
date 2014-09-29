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
<title>管理员后台中心</title>
<link rel="stylesheet" type="text/css" href="test/admin1.css">
<script type="text/javascript">
	function getAppByApp() {
		var href = "countServlet?method=getByApp&appid="+ document.getElementById("appid").value;
		//alert(href);
		window.location.href = href;
	}
</script>
</head>
<body>
	<center>
		<table width="80%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
			<caption>按数据服务统计界面</caption>
			<tr class="tr_title">
				<td colspan="6">请选择APP：<select id="appid" onblur="getAppByApp()"><c:forEach var="idname" items="${mapidname}">
							<option value="${idname.key}">${idname.value}</option>
						</c:forEach>
				</select>
				</td>
			</tr>

			<tr class="tr_title">
				<td>用户名</td>
				<td>数据服务</td>
				<td>appkey</td>
				<td>今日使用次数</td>
				<td>今日剩余次数</td>
				<td>操作</td>
			</tr>
			<c:forEach var="myapp" items="${listsbyapp}">
				<tr class="tr_content">
					<td>${myapp.username}</td>
					<td>${myapp.appname}</td>
					<td>${myapp.appkey}</td>
					<td>${myapp.times}</td>
					<td>${3-myapp.times}</td>
					<td><a href="userServlet?method=delById&id=

${user.userid}">加入黑名单</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>