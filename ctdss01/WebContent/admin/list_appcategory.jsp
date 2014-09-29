<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
			<tr class="tr_title"><td>id</td><td>服务种类名称</td><td>操作</td></tr>
			
			 <c:forEach var="acg" items="${listacgs}">
				<tr class="tr_content">
		            <td>${acg.id}</td>
		            <td>${acg.name}</td>
		            <td>
		            <a href="appCateServlet?method=getById&id=${acg.id}">编辑</a>
                    <a href="appCateServlet?method=delById&id=${acg.id}">删除</a></td>
				</tr>
			    </c:forEach>
			 </table>
			</center>
</body>
</html>