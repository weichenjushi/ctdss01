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
<title>案例集锦</title>
<link rel="stylesheet" href="index/css/about.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">  
	<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
	<link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />
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
	<div class="forshowfooter2">
	<div class="div_help_content">
		<p class="samples"><a>Samples:如何使用数据服务</a></p>
	    <p class="title1">1. 如何调用不带参数的数据服务</p>
		<p class="title2">1.1 用户登录后，进入“浏览数据接口”页面，如图1所示。</p>
		<p class="picture"><img src="index/images/samples/diagram1.png" width="1000" height="432" alt="Figure4"></p>
		<p class="title4">图 1 浏览数据接口页面</p>
		<p class="title2">1.2 点击图1中的任何一图标进入该数据服务的详细介绍页面，如图2所示。</p>
		<p class="picture"><img src="index/images/samples/diagram2.png" width="1000" height="432" alt="Figure4"></p>
		<p class="title4">图 2 数据服务详细信息页面</p>
		<p class="title2">1.3 用户调用该数据服务前，必须先申请该数据，点击图2中的A处，即可申请到该数据服务，并进入“我的数据服务”页面，如图3所示。</p>
		<p class="picture"><img src="index/images/samples/diagram3.png" width="1000" height="396" alt="Figure4"></p>
		<p class="title4">图 3我的数据服务页面</p>
		<p class="title2">1.4 点击图3中的A处“接口”超链接，进入图2，并且点击C处，进入数据服务调用模拟器中，如图4所示。</p>
		<p class="picture"><img src="index/images/samples/diagram7.png" width="1000" height="442" alt="Figure4"></p>
		<p class="title4">图 4数据服务调用模拟器</p>
		<p class="title2">1.5选择调用接口所返回的数据格式，如果点击A处，数据返回格式是json，如图5所示；如果点击B处，数据返回格式为xml，如图6所示。</p>
		<p class="picture"><img src="index/images/samples/diagram9.png" width="1000" height="442" alt="Figure4"></p>
		<p class="title4">图 5模拟器中返回数据格式为json页面</p>
		<p class="picture"><img src="index/images/samples/diagram8.png" width="1000" height="442" alt="Figure4"></p>
		<p class="title4">图 6模拟器中返回数据格式为xml页面</p>
		<p class="title1">2. 如何调用带参数的数据服务</p>
		<p class="title2">2.4前3步与，1.1-1.3步骤一样，不在赘述， 点击图3中的A处“接口”超链接，进入图2，并且先点击图2中的B处，然后点击C处，进入数据服务调用模拟器中，如图7所示。</p>
		<p class="picture"><img src="index/images/samples/diagram4.png" width="1000" height="443" alt="Figure4"></p>
		<p class="title4">图 7带参数的数据服务调用模拟器</p>
		<p class="title2">2.5 在图7中API参数文本框中输入具体的参数值，并且选择返回的数据格式，若点击A处，返回数据格式为json，效果如图8所示；若点击B处，返回数据格式为xml，效果如图9所示。</p>
		<p class="picture"><img src="index/images/samples/diagram5.png" width="1000" height="455" alt="Figure4"></p>
		<p class="title4">图 8模拟器中返回数据格式为json页面</p>
		<p class="picture"><img src="index/images/samples/diagram6.png" width="1000" height="448" alt="Figure4"></p>
		<p class="title4">图 9模拟器中返回数据格式为xml页面</p>
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
					<button class="button" onclick="window.location.href='index/about/myindex.jsp">Home</button>
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