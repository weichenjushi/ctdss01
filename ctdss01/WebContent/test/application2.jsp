<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="index/css/core_css/index.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="stylesheet" type="text/css" href="test/docsnew.css">
<link rel="stylesheet" type="text/css" href="test/news_content.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/CityList/1.2/src/CityList_min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
<link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />
<title>根据地铁名称查询站点信息</title>
</head>

<body>
	<div id="main" class="header" style="">
		<ul class="nav-head">
			<li class="lssss cur"><a href="index/core/myindex.jsp">首页</a>
			</li>
			<li class="ls"><a href="index/core/browse.jsp">浏览数据接口</a>
			</li>
			<li class="ls"><a href="APIServlet?method=viewmyapps">我的数据服务</a>
			</li>
			<li class="ls"><a href="index/core/create_mashup_traditional.jsp">常见问题</a>
			</li>
			<li class="lss"><a href="index/Navigator/index.jsp">应用</a>
			</li>
			<li class="lss"><a href="index/about/take_a_tour.jsp">帮助</a></li>
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
		<table>
			<tr>
				<td>
					<h2><label id="msg">【北京市地铁各站点信息】</label></h2>
					<div id="map" style="width: 1000px; height: 650px">Callculate...</div></td>
				<td style="text-align: top"></td>
			</tr>
		</table>
		<form action="" name="myform">
		<table width="1000px;">
			<tr width="1000px"><td width="600px;">请输入API地址：<textarea cols="120" width="500px;" rows="1" name="requestUrl" id="requestUrl">http://10.5.83.166:8080/ctdss01/ExcelRestServlet/dbtables/t_substation?key=58c5392c817d4991ba60521fdce606d4&dtype=xml</textarea></td>
			<td><input type="button" id="myshow" value="调用接口" onclick="show()"/></td></tr>
			
			<!-- <tr>
				<td>数据格式：<h4><a id="xml" target="_blank">xml</a></h4><h4><a id="json" target="_blank">json</a></h4></td>
				<td>
				</td>
			</tr> -->
			
		</table>
		</form>
	</div>
</body>

<script type="text/javascript">
    var routename= $("#routname").val();
    $(document).ready(function(){
		$("#xml").click(function(){
			window.location.href="/ctdss01/ExcelRestServlet/dbtables/getroute?key=fe8f7d3ad3234627a3e0562eaf048672&dtype=xml&routename="+routename;
		});
		$("#json").click(function(){
			window.location.href="/ctdss01/ExcelRestServlet/dbtables/getroute?key=fe8f7d3ad3234627a3e0562eaf048672&dtype=json&routename="+routename;
		});
		
		
		
	});
	var map, geocoder, point, addresslat, addresslng, xmlhttp, xmlhttp2;
	
	//selectClick();
	//selectService();
	init();
	// 创建CityList对象，并放在citylist_container节点内 
	var myCl = new BMapLib.CityList({
		container : "citylist_container",
		map : map
	});
	document.getElementById('wait').style.visibility = "hidden";
	function init() {
		map = new BMap.Map("map");
		map.centerAndZoom(new BMap.Point(116.404, 39.915), 10);
		map.enableScrollWheelZoom();
		map.addControl(new BMap.NavigationControl());
		map.addControl(new BMap.ScaleControl());
		map.addControl(new BMap.OverviewMapControl());
		map.addControl(new BMap.MapTypeControl());
	}

	function addMarker(point) {
		var marker = new BMap.Marker(point);
		map.addOverlay(marker);
	}
	function count() {
		count = 0;
	}
	
	var count = 0;
	function show() {
		map.clearOverlays();
		var url=$("#requestUrl").val();		
		var fileurl=url.substring(21,url.length);
		$("#requestUrl").html("http://10.5.83.166:8080"+fileurl);		
		var index=0;
		jQuery.get(fileurl, function(data) {
			var sum=jQuery(data).find("t_substation").length;
			//alert(sum);
			jQuery(data).find("t_substation").each(
					function() {
						index++;
						var eachMarker = jQuery(this);
						var name = eachMarker.find("name").text();
						var istop = eachMarker.find("istop").text();
						var istopresult=(istop=="1")?"是":"否";
						var address = eachMarker.find("name").text();
						var html = "<div class='info-blob'>" + "<h3>" + name
							+ "</h3>站点"+index +"："+ address + "<br />是否中转站：" + istopresult
							+ "<br /></div>";
						check(html, address, name,index);
					});
		});
	}
	
	//搜索 
	function check(html, searchTxt, name,index) {
		map.clearOverlays();
		// 创建地址解析器实例 
		var myGeo = new BMap.Geocoder();
		// 将地址解析结果显示在地图上，并调整地图视野 
		myGeo.getPoint(searchTxt, function(point) {
			var carMk;
			var myP1;
			var myP2;
			 if (point) {
				map.centerAndZoom(point, 12);
				var pointMarker = new BMap.Point(point.lng, point.lat);
// 				carMk= new BMap.Marker(pointMarker,{icon:myIcon});
				carMk= new BMap.Marker(pointMarker);
		        map.addOverlay(carMk);
		        var infowindow = new BMap.InfoWindow(html); // 创建信息窗口对象
				carMk.setAnimation(BMAP_ANIMATION_DROP); //坠落的动画
				carMk.addEventListener("click", function() {
					carMk.openInfoWindow(infowindow, pointMarker);
					document.getElementById("routeEnd").value = name.replace(
							/<[\/\!]*?[^<>]*?>/g, "");
				}); 
				document.getElementById('wait').style.visibility = "hidden";
				}
		}, "北京");
	}
	

	var XMLHttpReq;
	function createXMLHttpRequest() {
		if (window.XMLHttpRequest) {
			XMLHttpReq = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			try {
				XMLHttpReq = new ActiveXObject("MSXML2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReq = new ActiveXObject("Mircsoft.XMLHTTP");
				} catch (e1) {
				}
			}
		}
	}
	function sendRequest(url) {
		createXMLHttpRequest();
		XMLHttpReq.open("POST", "RegisterServlet", true);
		XMLHttpReq.onreadystatechange = processResponse;
		XMLHttpReq.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		XMLHttpReq.send(url);
	}
	function processResponse() {
		if (XMLHttpReq.readyState == 4) {
			if (XMLHttpReq.status == 200) {
			} else {
				window.alert("The page you request is abnormal!");
			}
		}
	}
	function generate(serviceID, listfilename, servicename) {
		sendRequest("&time=" + new Date().getTime()
				+ "&service=generate&serviceID=" + serviceID + "&listfilename="
				+ listfilename + "&servicename=" + servicename);
	}
</script>
</html>