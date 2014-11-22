<%@ page contentType="text/html;charset=UTF-8"%>   
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/layout">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
    <link rel="stylesheet" type="text/css" href="index/css/core_css/head_menu.css">  
    <link rel="stylesheet" type="text/css" href="test/news_content.css">
    <link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />
    <script type="text/javascript" src="test/jquery.min.js"></script>
	<script language="javascript" type="text/javascript">
	
	
</script>
    <title>城市交通数据服务空间</title>
    
<body id="body1">   
<div class="forshowfooter1"> 
	<div id="main" class="header">
		<ul class="nav-head">
			<li class="lssss"><a href="index/core/myindex.jsp">首页</a></li>
			<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a></li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a></li>
			<li class="ls"><a href="index/core/create_mashup_traditional.jsp">常见问题</a></li>
		<!-- 	<li class="l"><a><span>创建数据源</span></a>
				<div>
					<a href="index/core/create_data_service_clipper.jsp">网页数据源</a>
					<a href="index/core/create_data_service_wrapper.jsp">创建其他数据源</a>
				</div>
			</li> -->
			<li class="lss"><a href="index/Navigator/index.jsp">应用</a></li>
			<li class="lssss"><a href="index/about/take_a_tour.jsp">帮助</a></li>
			<%
				if (session.getAttribute("username") == null
						&& session.getAttribute("adminname") == null) {
			%>
			<li class="lssss"><a href="login.jsp">登录</a></li>
			<li class="lsss"><a href="signup.jsp">注册</a></li>
			<%
				} else {
			%>	
			<li  class="lsss"><a href="index/core/profile.jsp">用户中心</a></li>
			<li class="lssss"><a href="logout.jsp">退出</a></li>
			<%} %>
		</ul>
		<div style="margin:auto;padding:0;" id="maincontent">
		
		<div id="title">
		${news.title}
		</div>
		<div id="postime">
		[发表时间]：${news.addtime}&nbsp;&nbsp;&nbsp;[来源]：${news.sfrom}
		</div>
		<div id="newscontent" >
<%-- 		<c:out value="${news.content}" default="expression" escapeXml="true"/> --%>
		${news.content}
		</div>
		<%-- <table width="80%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" style="margin: auto;">	
					<tr class="tr_title">
						<td>标题</td>
						<td>来源</td>
						<td>发表时间</td>
						<td>内容</td>	
					</tr>
					<c:forEach var="listnew" items="${listnews}">
						<tr class="tr_content">
							<td>${news.title}</td>
							<td>${news.sfrom}</td>
							<td>${news.addtime}</td>	
							<td>${news.content}</td>	
						</tr>
					</c:forEach>
					

				</table> --%>
			
		</div>
		
        <div id="ft">Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a></div><!--/#ft --> 
	</div><!--/#doc -->
	</div>
</body>

</html>	