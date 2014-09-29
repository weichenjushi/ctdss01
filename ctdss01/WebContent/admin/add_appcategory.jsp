<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员后台中心</title>
<link rel="stylesheet" type="text/css" href="test/admin1.css">
</head>
<body>
	<form action="<%=basePath%>appCateServlet?method=add" method="post">
		<center>
		<table width="50%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
			<caption>数据服务种类新增界面</caption>
			<tr class="tr_title"><td>数据服务种类：</td><td><input type="text" name="acategoryname"/></td></tr>
			<tr class="tr_title"><td colspan="2"><td><input type="submit" name="新增"/></td></tr>
		</table>
		</center>
	</form>
</body>
</html>