<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>城市交通数据服务空间</title>
<link rel="stylesheet" href="index/css/about.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
  </head>
  
  <body>
  <div id="main" class="header">
	<div class="header">
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
	</div>
  <div class="forshowfooter1">
	
	<div class="forshowfooter2" style="line-height: 28px;">
	<div class="div_help_content">
		<p class="title1_overview">1.什么是城市交通数据服务空间?</p>
		<p class="title2_overview"> &nbsp;&nbsp;&nbsp;&nbsp;城市交通数据服务空间（City Traffic DataServiceSpace），简称CTDSS，是一套为开发者提供全国城市交通相关的数据服务的系统，通过将数据封装成数据服务，并对外提供接口，便于数据的维护、更新，保证数据“新”、“好”、“多”。 城市交通数据服务空间对外提供标准统一的API接口，通过调用接口，获取的数据格式为xml和json格式，方便开发者调用、处理、使用。城市交通数据服务空间的数据来源大部分为各城市政务网上的数据，还有一部分为北方工业大学实验室处理后的数据，从而确保了数据的可靠性、全面性。</p>
		<p class="title1_overview">2.什么是数据服务?</p>
		<p class="title2_overview">&nbsp;&nbsp;&nbsp;&nbsp;数据服务是一种软件服务，它封装了企业相关的关键数据实体的操作。数据服务让消费者无需去访问或者更新多个数据源，更重要的是，当消费者需要操作多个数据源时，数据服务有助于维持数据的完整性。此外，它们还能够帮助构建可被多个项目和创新利用的可重用数据服务。数据服务还能够执行关键的治理职能——它们有助于度量指标的集中化、监视、版本管理、数据类型的重用，以及执行数据可视化和访问规则。 </p>	
		<!-- <p class="title1_overview">3.What is the composite data service?</p>
		<p class="title2_overview">&nbsp;&nbsp;&nbsp;&nbsp;To provide a value-added service, different data services can be composed into a new one. We call a data service, which is composed by two or more data services, as   a composite data service. A composite data service will also be registered into DSS to be further discovered and utilized by users.</p> -->
	</div>

	<table class="table_button" width=100%>
		<tr>
			<td width="15%"></td>
			<td>
				<p>
					<button class="button"  onclick="window.location.href='index/about/take_a_tour.jsp'">Back</button>
				</p>
			</td>
			<td>
				<p>
					<button class="button" onclick="window.location.href='index/core/myindex.jsp'">Home</button>
				</p>
			</td>
			<td width="15%"></td>
		</tr>
	</table>
	</div>
	<jsp:include page="/public/footer.jsp"></jsp:include>
  </div>
  </div>
  </body>
</html>