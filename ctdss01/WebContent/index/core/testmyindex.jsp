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

<link rel="stylesheet" type="text/css" href="index/css/core_css/layout">
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="stylesheet" type="text/css" href="test/news_content.css">
<link rel="stylesheet" type="text/css" href="test/docsnew.css">

<!--[if IE]><style>.subactions { padding-right:8px;} 
	.subactions.active padding-right:10px;} 
	.subactions img { vertical-align:middle;  } 
	#pipepreview h2 { border-top:2px solid #e4e4e4; }
	</style>
	<![endif]-->
<title>城市交通数据服务空间</title>

</head>
<body>

	<div id="main" class="header">

		<ul class="nav-head">
			<li class="lssss cur"><a href="index/core/myindex.jsp">首页</a>
			</li>
			<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a>
			</li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a>
			</li>
			<li class="ls"><a href="index/core/create_mashup_traditional.jsp">常见问题</a>
			</li>
			<!-- 	<li class="l"><a><span>创建数据服务</span></a>
				<div>
					<a href="index/core/create_data_service_clipper.jsp">创建网页数据源</a>
					<a href="index/core/create_data_service_wrapper.jsp">创建其他数据源</a>
				</div>
			</li> -->
			<li class="lss"><a href="index/Navigator/index.jsp">应用</a>
			</li>
			<li class="lss"><a href="index/about/take_a_tour.jsp">帮助</a> <!-- <div>
						<a href="index/weixin/weixin.jsp">weixin</a>
					</div> --></li>
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
			<li class="lsss"><a href="index/core/profile.jsp">用户中心</a>
			</li>
			<li class="lsss"><a href="logout.jsp">退出</a>
			</li>
			<%
				}
			%>
		</ul>


		<div id="bd">








			<div id="docs-main">
				<div class='data_title'>
					<ul class='tabUl1 clear'></ul>
					<div class='allBox1'>
						<div class='box_data' style='display: block;'>
							<ul class='data_ul clear'>
								<li style='background: #FF6600; color: #fff; width: 30px; height: 110px; padding-top: 5px'>热<br />门<br />数<br />据<br />服<br />务<br />
								<li><div class='divimg'>
											<a class="hotds" href='apps/id/38' target='_blank'></a>
										</div>
										<h2>
											<a href='apps/id/38' target='_blank'>北京市地铁轨道交通线路</a>
										</h2>
									</li>
									<li><div class='divimg'>
											<a class="hotds" href='apps/id/2' target='_blank'></a>
										</div>
										<h2>
											<a href='apps/id/2' target='_blank'>北京市地铁轨道交通站点</a>
										</h2>
									</li>
									<li><div class='divimg'>
											<a class="hotds" href='apps/id/3' target='_blank'></a>
										</div>
										<h2>
											<a href='apps/id/3' target='_blank'>北京市机场班车线路</a>
										</h2>
									</li>
							</ul>
						</div>
						<div class='box_data'>
							<ul class='data_ul clear'>
								<li style='background: #00b271; color: #FFF; width: 30px; height: 110px; padding-top: 5px'>最<br />新<br />数<br />据<br />服<br />务<br />
								</li>
								<li><div class='divimg'>
										<a href='apps/id/38' class='newds' target='_blank'></a>
									</div>
									<h2>
										<a href='apps/id/38' target='_blank'>北京市地铁轨道交通线路</a>
									</h2>
								</li>
								<li><div class='divimg'>
										<a href='apps/id/36' class='newds' target='_blank'></a>
									</div>
									<h2>
										<a href='apps/id/36' target='_blank'>上海市机动车维修行业统计</a>
									</h2>
								</li>
								<li><div class='divimg'>
										<a href='apps/id/35' class='newds' target='_blank'></a>
									</div>
									<h2>
										<a href='apps/id/35' target='_blank'>上海市汽车快修企业名录</a>
									</h2>
								</li>
								<li><div class='divimg'>
										<a href='apps/id/34' class='newds' target='_blank'></a>
									</div>
									<h2>
										<a href='apps/id/34' target='_blank'>上海市公共停车场库名录</a>
									</h2>
								</li>
								<li><div class='divimg'>
										<a href='apps/id/33' class='newds' target='_blank'></a>
									</div>
									<h2>
										<a href='apps/id/33' target='_blank'>上海市省际客运站信息</a>
									</h2>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class='content'>
					<div class='content1'>
						<div style='margin-left: 100px; margin-top: 120px; text-align: left; vertical-align: middle;'>
							<br>
							<br>
							<div class='news-td'>
								<a class='news' href='news/recent/18' target='_blank' title='美国俄克拉荷马大学代表团来校访问'><p>美国俄克拉荷马大学代表团来校访问</p>
								</a>
							</div>
							<div class='news-td'>
								<a class='news' href='news/recent/17' target='_blank' title='我校与石景山区四小学召开体育美育工作会'><p>我校与石景山区四小学召开体育美育工作会</p>
								</a>
							</div>
							<div class='news-td'>
								<a class='news' href='news/recent/16' target='_blank' title='我校学生在全国大学生智能车竞赛中获6个奖项'><p>我校学生在全国大学生智能车竞赛中获6个奖项</p>
								</a>
							</div>
							<div class='news-td'>
								<a class='news' href='news/recent/15' target='_blank' title='国内各市政府开放数据'><p>国内各市政府开放数据</p>
								</a>
							</div>
							<div class='more'>
								<a class='more-a' href='news/recent' target='_blank'>more&nbsp;<img src='images/arrow.jpg' />
								</a>
							</div>
						</div>
					</div>
					<div class='content2'>
						<br>
						<br>
						<div style='margin-left: 100px; text-align: left'>
							<div class='news-td'>
								<a class='news' href='news/import/18' target='_blank' title='美国俄克拉荷马大学代表团来校访问'><p>美国俄克拉荷马大学代表团来校访问</p>
								</a>
							</div>
							<div class='news-td'>
								<a class='news' href='news/import/17' target='_blank' title='我校与石景山区四小学召开体育美育工作会'><p>我校与石景山区四小学召开体育美育工作会</p>
								</a>
							</div>
							<div class='news-td'>
								<a class='news' href='news/import/15' target='_blank' title='国内各市政府开放数据'><p>国内各市政府开放数据</p>
								</a>
							</div>
							<div class='more'>
								<a class='more-a' href='news/import' target='_blank'>more&nbsp;<img src='images/arrow.jpg' />
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>



			<script type="text/javascript">
				function GetStr9(str) {
					var len = 0;
					var lin = "";
					var result = "";
					var resultLen = 0;
					for ( var i = 0; i < str.length; i++) {
						if (str.charCodeAt(i) > 255)
							len += 2;
						else
							len++;
						lin += str.charAt(i);
						if (len > 28) {
							if (lin.length < str.length) {
								for ( var j = 0; j < str.length; j++) {
									if (str.charCodeAt(j) > 255)
										resultLen += 2;
									else
										resultLen++;
									result += str.charAt(j);
									if (resultLen >= 26) {
										lin = result + '...';
										break;
									}

								}
							}
							break;
						}

					}
					return lin;
				}
			</script>

















			<marquee>
				<ul style="background: #00B4ED; color: #FFF; width: 300px; height: 80px; padding-top: 5px">
					<li style="padding-left: 5px; width: 150px; height: 40px; list-style: none;">网站公告</li>
					<li style="padding-left: 5px; width: 150px; height: 20px; list-style: none;">最新添加数据为：${ad}</li>
				</ul>
			</marquee>
			<div id="ft">
				Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a>
			</div>
			<!--/#ft -->
		</div>

		<!--/#doc -->
	</div>
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