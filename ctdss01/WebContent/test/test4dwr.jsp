<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<script type='text/javascript' src='js/dwr-bayeux.js'></script>
<script type='text/javascript' src='js/engine.js'></script>
<script type='text/javascript' src='dwr/interface/testDWR1.js'></script>
</head>
<body>

</html>