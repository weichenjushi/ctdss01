<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- 	<base href="<%=basePath%>"> --%>
	<link rel="stylesheet" href="<%=basePath%>index/css/log_sign.css">
	<link rel="stylesheet" href="<%=basePath%>index/css/head_menu.css">
	<script language="javascript" src="<%=basePath%>index/log_sign/js/login.js"></script>
	<div class="header">
		<ul class="nav-head">
			<li class="lssss"><a href="<%=basePath%>index/core/myindex.jsp">首页</a></li>
			<li class="lsss"><a href="<%=basePath%>index/core/browse.jsp">浏览</a></li>
			<li class="ls"><a href="<%=basePath%>index/core/mydataservice.jsp">我的数据服务</a></li>
			<li class="ls"><a href="<%=basePath%>index/core/create_mashup_traditional.jsp">常见问题</a></li>
			<li class="lss"><a href="<%=basePath%>index/Navigator/index.jsp">应用</a></li>
			<li class="lssss"><a href="<%=basePath%>index/about/take_a_tour.jsp">帮助</a></li>
			<li class="lssss"><a href="<%=basePath%>login.jsp">登录</a></li>
			<li class="lsss"><a href="<%=basePath%>signup.jsp">注册</a></li>
		</ul>
	</div>
