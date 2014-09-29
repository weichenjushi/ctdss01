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
			<table width="40%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
			<tr class="tr_title"><td>id</td><td>用户等级</td><td>积分</td><td>每日访问次数</td><td>操作</td></tr>
			
			 <c:forEach var="listulevel" items="${listulevels}">
				<tr class="tr_content">
		            <td>${listulevel.id}</td>
		            <td>Lv${listulevel.id}</td>
		             <td>${listulevel.points}</td>
		              <td>${listulevel.times}</td>
		            <td>
		            <a href="userServlet?method=editlevelinfoById&id=${listulevel.id}">编辑</a>
                    <%-- <a href="appCateServlet?method=dellevelById&id=${acg.id}">删除</a></td> --%>
				</tr>
			    </c:forEach>
			 </table>
			</center>
</body>
</html>