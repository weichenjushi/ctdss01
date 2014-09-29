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
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="stylesheet" type="text/css" href="test/docsnew.css">

<style type="text/css">
</style>


<script type="text/javascript" src="index/js/prototype.js"></script>
<script type="text/javascript" src="test/jquery.min.js"></script>
<title>城市交通数据服务空间</title>
</head>
<body onload="">
	<div id="main" class="header">
		<ul class="nav-head">
			<li class="lssss"><a href="index/core/myindex.jsp">首页</a>
			</li>
			<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a>
			</li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a>
			</li>
			<li class="ls"><a href="index/core/create_mashup_traditional.jsp">常见问题</a>
			</li>
			<!-- 	<li class="l"><a><span>创建数据源</span></a>
				<div>
					<a href="index/core/create_data_service_clipper.jsp">网页数据源</a>
					<a href="index/core/create_data_service_wrapper.jsp">创建其他数据源</a>
				</div>
			</li> -->
			<li class="lss"><a href="index/Navigator/index.jsp">应用</a>
			</li>
			<li class="lssss"><a href="index/about/take_a_tour.jsp">帮助</a>
			</li>
			<%
				if (session.getAttribute("username") == null
						&& session.getAttribute("adminname") == null) {
			%>
			<li class="lssss"><a href="login.jsp">登录</a>
			</li>
			<li class="lsss"><a href="signup.jsp">注册</a>
			</li>
			<%
				} else {
			%>
			<li class="lsss"><a href="index/core/profile.jsp">用户中心</a>
			</li>
			<li class="lssss"><a href="logout.jsp">退出</a>
			</li>
			<%
				}
			%>
		</ul>

		<div id="bd">

			this is testbrowser.jsp
			<div id="query" style="display: none;">
				<img src="<%=basePath%>images/china.jpg" alt="网站地图" width="530" height="453" border="0" usemap="#Map" />
				<map name="Map" id="Map">
					<area shape="rect" coords="373,159,391,169" onclick="initDataServicesByCtid('bj')" alt="北京市" />
					<area shape="rect" coords="421,267,440,278" onclick="initDataServicesByCtid('sh')" alt="上海市" />
				</map>
			</div>
			<div id="kong" style="height: 140px; width: 500px; top: 170px;" id="trigger">
				<!-- 		<div id="kong" style="float:left;height: 453px;width:200px; top: 170px;margin-top: -400px;" id="trigger"> -->
				<!--浮动框-->
				<div id="out">
					<div id="tit">
						-<br>-<br>-<br>-<br>-<br>-<br>-<br>-<br>-<br>-<br>-<br>
					</div>
					<div class="right">
						<p class="words_no_link" id="t">
							展<br>开<br>搜<br>索<br>框
						</p>
					</div>
				</div>
			</div>



			<br>
			<div id='content'></div>
			<!--/#content -->


			<div id="docs-main">
				<div style="height: 30px; widows: 100%"></div>
				<div id="main2">
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
											<a class="newds" href='apps/id/38' target='_blank'></a>
										</div>
										<h2>
											<a href='apps/id/38' target='_blank'>北京市地铁轨道交通线路</a>
										</h2>
									</li>
									<li><div class='divimg'>
											<a class="newds" href='apps/id/36' target='_blank'></a>
										</div>
										<h2>
											<a href='apps/id/36' target='_blank'>上海市机动车维修行业统计</a>
										</h2>
									</li>
									<li><div class='divimg'>
											<a class="newds" href='apps/id/35' target='_blank'></a>
										</div>
										<h2>
											<a href='apps/id/35' target='_blank'>上海市汽车快修企业名录</a>
										</h2>
									</li>
									<li><div class='divimg'>
											<a class="newds" href='apps/id/34' target='_blank'></a>
										</div>
										<h2>
											<a href='apps/id/34' target='_blank'>上海市公共停车场库名录</a>
										</h2>
									</li>
									<li><div class='divimg'>
											<a class="newds" href='apps/id/33' target='_blank'></a>
										</div>
										<h2>
											<a href='apps/id/33' target='_blank'>上海市省际客运站信息</a>
										</h2>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class='data_title'>
						<div class='title'>&gt;飞机</div>
						<ul class='data_ul clear'>
							<li><div class='divimg'>
									<a class="airplane" href='apps/id/3' target='_blank'></a>
								</div>
								<h2>
									<a  href='apps/id/3' target='_blank'>北京市机场班车线路</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a class="airplane" href='apps/id/4' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/4' target='_blank'>北京市机场班车站点</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a class="airplane" href='apps/id/24' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/24' target='_blank'>上海市国内航运企业名录 </a>
								</h2>
							</li>
						</ul>
					</div>
					<div class='data_title'>
						<div class='title'>&gt;地铁</div>
						<ul class='data_ul clear'>
							<li><div class='divimg'>
									<a class="subway" href='apps/id/2' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/2' target='_blank'>北京市地铁轨道交通站点</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a class="subway" href='apps/id/38' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/38' target='_blank'>北京市地铁轨道交通线路</a>
								</h2>
							</li>
						</ul>
					</div>
					<div class='data_title'>
						<div class='title'>&gt;汽车</div>
						<ul class='data_ul clear'>
							<li><div class='divimg'>
									<a href='apps/id/5' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/5' target='_blank'>北京市城市文明加油站 </a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/7' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/7' target='_blank'>北京市出租企业信息</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/8' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/8' target='_blank'>北京市道路危险货物运输企业</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/9' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/9' target='_blank'>北京市高速公路</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/10' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/10' target='_blank'>北京市国道</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/11' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/11' target='_blank'>北京市货运站点</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/12' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/12' target='_blank'>北京市快速路</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/13' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/13' target='_blank'>北京市旅游客运企业信息</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/14' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/14' target='_blank'>北京市汽车租赁企业信息</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/15' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/15' target='_blank'>北京市省道</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/16' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/16' target='_blank'>北京市省际客运场所</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/17' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/17' target='_blank'>北京市主干路</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/32' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/32' target='_blank'>上海市主要公交枢纽站信息</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/33' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/33' target='_blank'>上海市省际客运站信息</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/34' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/34' target='_blank'>上海市公共停车场库名录</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/35' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/35' target='_blank'>上海市汽车快修企业名录</a>
								</h2>
							</li>
						</ul>
					</div>
					<div class='data_title'>
						<div class='title'>&gt;执法监管</div>
						<ul class='data_ul clear'>
							<li><div class='divimg'>
									<a class="supervision" href='apps/id/18' target='_blank'></a>
								</div>
								<h2>
									<a  href='apps/id/18' target='_blank'>北京市车管所</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a class="supervision" href='apps/id/19' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/19' target='_blank'>北京市交通事故处理机构</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a class="supervision" href='apps/id/20' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/20' target='_blank'>北京市交通支大队</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a class="supervision" href='apps/id/21' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/21' target='_blank'>北京市交通执法机构</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a class="supervision" href='apps/id/22' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/22' target='_blank'>北京市进京检查站</a>
								</h2>
							</li>
						</ul>
					</div>
					<div class='data_title'>
						<div class='title'>&gt;轮船</div>
						<ul class='data_ul clear'>
							<li><div class='divimg'>
									<a class="ship" href='apps/id/23' target='_blank'></a>
								</div>
								<h2>
									<a  href='apps/id/23' target='_blank'>上海市道路货运搬场企业名录</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a class="ship" href='apps/id/25' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/25' target='_blank'>上海市客运轮渡信息</a>
								</h2>
							</li>
						</ul>
					</div>
					<div class='data_title'>
						<div class='title'>&gt;其他</div>
						<ul class='data_ul clear'>
							<li><div class='divimg'>
									<a href='apps/id/26' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/26' target='_blank'>上海市2011年机动车维修质量信誉考核3A企业名录</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/27' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/27' target='_blank'>上海市道路危险货物运输企业名录</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/28' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/28' target='_blank'>上海市道路运输驾驶员从业资格培训企业名录</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/29' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/29' target='_blank'>上海市公共停车场库经营统计</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/30' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/30' target='_blank'>上海市普通机动车驾驶员培训企业名录</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/31' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/31' target='_blank'>上海市营运交通工具统计</a>
								</h2>
							</li>
							<li><div class='divimg'>
									<a href='apps/id/36' target='_blank'></a>
								</div>
								<h2>
									<a href='apps/id/36' target='_blank'>上海市机动车维修行业统计</a>
								</h2>
							</li>
						</ul>
					</div>
					<div class='data_title'>
						<div class='title'>&gt;学校</div>
						<ul class='data_ul clear'></ul>
					</div>

				</div>

			</div>
			<!--/#docs-main -->

		</div>
		<!--/#bd -->

	</div>
	<!--/#doc -->
</body>
<script type="text/javascript">
	var theTable;
	var totalPage;
	var pageNum;

	var spanPre;
	var spanNext;
	var spanFirst;
	var spanLast;

	var numberRowsInTable;
	var pageSize = 8;
	var page = 1;

	function qk() {
		var searchInputdata = document.getElementById("searchInputdata").value;
		if (searchInputdata == "Search data service name,or description") {
			document.getElementById("searchInputdata").value = "";
		}

	}
	function mr() {
		var searchInputdata = document.getElementById("searchInputdata").value;
		if (searchInputdata == "") {
			document.getElementById("searchInputdata").value = "Search data service name,or description";
		}

	}
	function select_list(domainmap) {
		document.getElementById("topnav1").innerHTML = "";
		var domain = document.getElementById("selectDomain");
		domain.innerHTML = "";
		domain.options.add(new Option("Domain", "Domain"));
		domain.options.add(new Option("Any Domain", "Any Domain"));
		var domains = domainmap.split("##%%");
		//     var num = 0;
		for ( var j = 0; j < domainmap.length - 1; j++) {
			var types = domains[j].split(",");
			var option = document.createElement("option");
			option.value = types[0];
			option.innerHTML = types[0];
			domain.appendChild(option);
			//         num++;
			document.getElementById("topnav1").innerHTML += "<li><a class=\"navlink\" href=\"javascript:findDomain('"
					+ types[0]
					+ "')\">"
					+ types[0]
					+ "</a><span class=\"attibutenumCSS\">("
					+ types[1]
					+ ")&nbsp;&nbsp;&nbsp;</span></li>"
			//         if(num%10==0)
			//         {
			//         	document.getElementById("topnav1").innerHTML += "<br>";
			//         }
		}
	}

	function initDataServices() {
		var url = "BrowseServlet?cmd=init";
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("GET", url, true);
			req.onreadystatechange = initcomplete;
			req.send(null);
		}
	}

	function initcomplete() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				document.getElementById('main2').innerHTML = req.responseText;

				/* theTable = document.getElementById("table2");
				totalPage = document.getElementById("spanTotalPage");
				pageNum = document.getElementById("spanPageNum");

				spanPre = document.getElementById("spanPre");
				spanNext = document.getElementById("spanNext");
				spanFirst = document.getElementById("spanFirst");
				spanLast = document.getElementById("spanLast");

				numberRowsInTable = theTable.rows.length; */

				hide();
			}
		}
	}
	function initDataServicesByCtid(ctid) {
		var url = "BrowseServlet?cmd=initbycid&cid=" + ctid;
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("GET", url, true);
			req.onreadystatechange = initcompletebyctid;
			req.send(null);
		}
	}

	function initcompletebyctid() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				document.getElementById('main2').innerHTML = req.responseText;
			}
		}
	}
	function initTService() {
		var searchInputdata = "Search data service name,or description";
		var selectDomain = "Domain";
		var selectRelevance = "Relevance";
		var showuser = "";
		var checked = false;
		var url = "browseServlet/browse?cmd=initT&searchInputdata="
				+ searchInputdata + "&selectDomain=" + selectDomain
				+ "&selectRelevance=" + selectRelevance + "&showuser="
				+ showuser + "&checked=" + checked;
		if (window.XMLHttpRequest) {
			reqt = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			reqt = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (reqt) {
			reqt.open("post", url, true);
			reqt.onreadystatechange = initTcomplete;
			reqt.send(null);
		}
	}

	function initTcomplete() {
		if (reqt.readyState == 4) {
			if (reqt.status == 200) {
				var domainmap = reqt.responseText;
				select_list(domainmap);
			}
		}
	}
	function check() {
		var checked = document.getElementById("checkbox").checked;
		atomicChecked(checked);
	}

	function removeDataServices(id) {
		var url = "browseServlet/browse?cmd=remove&id=" + id;
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("post", url, true);
			req.onreadystatechange = removecomplete;
			req.send(null);
		}
	}

	function removecomplete() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var row = document.getElementById(req.responseText);
				var index = row.rowIndex;//rowIndex属性为tr的索引值，从0开始   
				theTable.deleteRow(index);//从table中删除
				numberRowsInTable = theTable.rows.length;
				initTService();
			}
		}
	}

	function findDataServices() {
		var searchInputdata = document.getElementById("searchInputdata").value;
		var selectDomain = document.getElementById("selectDomain").value;
		var selectRelevance = document.getElementById("selectRelevance").value;
		var showuser = document.getElementById("showuser").value;
		var checked = false;
		var selectRelevancedata;
		if (selectRelevance == "Relevance") {
			selectRelevancedata = "Relevance";
		} else if (selectRelevance == "Created by") {
			selectRelevancedata = "createdby";
		} else if (selectRelevance == "Created on") {
			selectRelevancedata = "createdon";
		} else if (selectRelevance == "Last Updated") {
			selectRelevancedata = "lastupdated";
		} else if (selectRelevance == "Update Frequency") {
			selectRelevancedata = "updatefrequency";
		} else if (selectRelevance == "Response Time") {
			selectRelevancedata = "responsetime";
		} else if (selectRelevance == "Total Rows") {
			selectRelevancedata = "totalrows";
		} else if (selectRelevance == "Data Volumn") {
			selectRelevancedata = "datavolumn";
		}

		var url = "browseServlet/browse?cmd=find&searchInputdata="
				+ searchInputdata + "&selectDomain=" + selectDomain
				+ "&selectRelevance=" + selectRelevancedata + "&showuser="
				+ showuser + "&checked=" + checked;
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("post", url, true);
			req.onreadystatechange = findcomplete;
			req.send(null);
		}

	}

	function findDomain(domain) {
		var searchInputdata = "Search data service name,or description";
		var selectDomain = domain;
		var selectRelevance = "Relevance";
		var showuser = "";
		var checked = false;
		var url = "browseServlet/browse?cmd=find&searchInputdata="
				+ searchInputdata + "&selectDomain=" + selectDomain
				+ "&selectRelevance=" + selectRelevance + "&showuser="
				+ showuser + "&checked=" + checked;
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("GET", url, true);
			req.onreadystatechange = findcomplete;
			req.send(null);
		}
	}

	function findExamples(Example) {
		document.getElementById("searchInputdata").value = Example;
		var searchInputdata = Example;
		var selectDomain = "Domain";
		var selectRelevance = "Relevance";
		var showuser = "";
		var checked = false;
		var url = "myDataServiceServlet/myDataService?cmd=find&searchInputdata="
				+ searchInputdata
				+ "&selectDomain="
				+ selectDomain
				+ "&selectRelevance="
				+ selectRelevance
				+ "&showuser="
				+ showuser + "&checked=" + checked;
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("post", url, true);
			req.onreadystatechange = findcomplete;
			req.send(null);
		}

	}

	function findcomplete() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				document.getElementById('content').innerHTML = req.responseText;
				theTable = document.getElementById("table2");
				totalPage = document.getElementById("spanTotalPage");
				pageNum = document.getElementById("spanPageNum");

				spanPre = document.getElementById("spanPre");
				spanNext = document.getElementById("spanNext");
				spanFirst = document.getElementById("spanFirst");
				spanLast = document.getElementById("spanLast");

				numberRowsInTable = theTable.rows.length;

				hide();

			}
		}
	}

	function reset() {
		document.getElementById("checkbox").checked = false;
		document.getElementById("searchInputdata").value = "Search data service name,or description";
		document.getElementById("selectDomain").value = "Domain";
		document.getElementById("selectRelevance").value = "Relevance";
		document.getElementById("showuser").value = "";
		document.getElementById('content').innerHTML = "";

	}

	function atomicChecked(checked) {
		var searchInputdata = document.getElementById("searchInputdatahidden").value;
		var selectDomain = document.getElementById("selectDomainhidden").value;
		var selectRelevance = document.getElementById("selectRelevancehidden").value;
		var showuser = document.getElementById("showuserhidden").value;
		var url = "myDataServiceServlet/myDataService?cmd=atomicchecked&searchInputdata="
				+ searchInputdata
				+ "&selectDomain="
				+ selectDomain
				+ "&selectRelevance="
				+ selectRelevance
				+ "&showuser="
				+ showuser + "&checked=" + checked;
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (req) {
			req.open("post", url, true);
			req.onreadystatechange = findcomplete;
			req.send(null);
		}
	}

	//下一页
	function next() {

		hideTable();

		currentRow = pageSize * page;
		maxRow = currentRow + pageSize;
		if (maxRow > numberRowsInTable)
			maxRow = numberRowsInTable;
		for ( var i = currentRow; i < maxRow; i++) {
			theTable.rows[i].style.display = '';
		}
		page++;

		if (maxRow == numberRowsInTable) {
			nextText();
			lastText();
		}
		showPage();
		preLink();
		firstLink();
	}

	//上一页
	function pre() {
		hideTable();
		page--;
		currentRow = pageSize * page;
		maxRow = currentRow - pageSize;
		if (currentRow > numberRowsInTable)
			currentRow = numberRowsInTable;
		for ( var i = maxRow; i < currentRow; i++) {
			theTable.rows[i].style.display = '';
		}

		if (maxRow == 0) {
			preText();
			firstText();
		}
		showPage();
		nextLink();
		lastLink();
	}

	//First Page
	function first() {
		hideTable();
		page = 1;
		for ( var i = 0; i < pageSize; i++) {
			theTable.rows[i].style.display = '';
		}
		showPage();
		firstText();
		preText();
		nextLink();
		lastLink();
	}

	//最后一页
	function last() {
		hideTable();
		page = pageCount();
		currentRow = pageSize * (page - 1);
		for ( var i = currentRow; i < numberRowsInTable; i++) {
			theTable.rows[i].style.display = '';
		}
		showPage();
		preLink();
		nextText();
		firstLink();
		lastText();
	}

	function hideTable() {
		for ( var i = 0; i < numberRowsInTable; i++) {
			theTable.rows[i].style.display = 'none';
		}
	}

	function showPage() {
		pageNum.innerHTML = page;
	}

	//总共页数
	function pageCount() {
		var count = 0;
		if (numberRowsInTable % pageSize != 0)
			count = 1;
		return parseInt(numberRowsInTable / pageSize) + count;
	}

	//显示链接
	function preLink() {
		spanPre.innerHTML = "<a href='javascript:pre();'>Previous Page</a>";
	}
	function preText() {
		spanPre.innerHTML = "Previous Page";
	}

	function nextLink() {
		spanNext.innerHTML = "<a href='javascript:next();'>Next Page</a>";
	}
	function nextText() {
		spanNext.innerHTML = "Next Page";
	}

	function firstLink() {
		spanFirst.innerHTML = "<a href='javascript:first();'>First Page</a>";
	}
	function firstText() {
		spanFirst.innerHTML = "First Page";
	}

	function lastLink() {
		spanLast.innerHTML = "<a href='javascript:last();'>Last Page</a>";
	}
	function lastText() {
		spanLast.innerHTML = "Last Page";
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
	$(document).ready(function() {
		$("#out").click(function() {
			//alert("hh");
			if ($("#query").css("display") == "none") {
				$("#query").css({
					display : "block"
				});
				$("#t").html("关<br>闭<br>搜<br>索<br>框");
			} else {
				$("#query").css({
					display : "none"
				});
				$("#t").html("打<br>开<br>搜<br>索<br>框");
			}

		})
	});
</script>
</html>

