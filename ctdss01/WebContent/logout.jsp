<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<%-- <base href="<%=Path%>"> --%>
	<base href="<%=basePath%>">
<title>退出</title>
<META http-equiv="refresh" content="0;url=login.jsp">
</head>
<body>
<%
if(session.getAttribute("username")!=null){
	session.removeAttribute("username");
}
if(session.getAttribute("adminname")!=null){
	session.removeAttribute("adminname");
}
%>
</body>
</html>