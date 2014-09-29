<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--     <link rel="stylesheet" type="text/css" href="index/css/core_css/layout"> -->
<link rel="stylesheet" type="text/css" href="test/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="stylesheet" type="text/css" href="test/docsnew.css">
<link rel="stylesheet" type="text/css" href="test/news_content.css">


<!--[if IE]><style>.subactions { padding-right:8px;} 
	.subactions.active padding-right:10px;} 
	.subactions img { vertical-align:middle;  } 
	#pipepreview h2 { border-top:2px solid #e4e4e4; }
	</style>
	<![endif]-->
<title>城市交通数据服务空间</title>
</head>
<body onload="initDataServicesHome();" style="background-color: #F8F8F8; height: 50px;">

	<div id="main" class="header">
			<ul class="nav-head">
				<li class="lssss cur"><a href="index/core/amyindex.jsp">首页</a>
				</li>
				<li class="ls"><a href="index/core/abrowse.jsp">浏览数据接口</a>
				</li>
				<li class="ls"><a href="index/core/acreate_data_service_wrapper.jsp">创建数据服务</a>
				</li>
				<li class="ls"><a href="index/core/amanage_users.jsp">用户管理</a>
				</li>
				<li class="ls"><a href="index/core/amanage_dataservices.jsp">数据服务管理</a>
				</li>
				<li class="ls"><a href="index/core/amanage_news.jsp">网站公告管理</a>
				</li>
				<%
					if (session.getAttribute("username") == null
							&& session.getAttribute("adminname") == null) {
				%>
				<li class="lss"><a href="login.jsp">登录</a>
				</li>
				<li class="lss"><a href="signup.jsp">注册</a>
				</li>
				<%
					} else {
				%>
				<li class="lsss"><a href="index/core/aprofile.jsp">用户中心</a>
				</li>
				<li class="lssss"><a href="logout.jsp">退出</a>
				</li>
				<%
					}
				%>
			</ul>
	
	<div id="bd">

		<div id="main2"></div>

		<marquee>
			<ul style="background: #00B4ED; color: #FFF; width: 300px; height: 80px; padding-top: 5px">
				<li style="padding-left: 5px; width: 150px; height: 40px;list-style: none;">网站公告</li>
				<li style="padding-left: 5px; width: 300px; height: 20px;list-style: none;">最新添加数据为：${ad}</li>
			</ul>
		</marquee>
		<div id="ft">
			Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a>
		</div>
		<!--/#ft -->
	</div>

	</div><!--/#doc -->
</body>
<script language="javascript">
	function initDataServicesHome() {
		var url = "BrowseServlet?cmd=initHome";
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("GET", url, true);
			req.onreadystatechange = initcomplete1;
			req.send(null);
		}
	}

	function initcomplete1() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				document.getElementById('main2').innerHTML = req.responseText;
				hide();
			}
		}
	}
	function dataServices() {
		var url = "myDataServiceServlet/myDataService?cmd=serviceitem";
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("post", url, true);
			req.onreadystatechange = dataServicescomplete;
			req.send(null);
		}
	}

	function dataServicescomplete() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				document.getElementById('content').innerHTML = req.responseText;
			}
		}
	}

	function lastestdataServices() {
		var url = "browseServlet/browse?cmd=popservice";
		if (window.XMLHttpRequest) {
			req1 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req1 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req1) {
			req1.open("post", url, true);
			req1.onreadystatechange = lastestdataServicescomplete;
			req1.send(null);
		}
	}

	function lastestdataServicescomplete() {
		if (req1.readyState == 4) {
			if (req1.status == 200) {
				document.getElementById('content1').innerHTML = req1.responseText;
			}
		}
	}
	//隐藏表格
	function hide() {
		for ( var i = pageSize; i < numberRowsInTable; i++) {
			theTable.rows[i].style.display = 'none';
		}

		totalPage.innerHTML = pageCount();
		pageNum.innerHTML = '1';
		if ((numberRowsInTable > pageSize) && (pageCount() > page)) {
			nextLink();
			lastLink();
		}
	}
</script>
</html>