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
					<h2><label id="msg"></label></h2>
					<div id="map" style="width: 900px; height: 550px">Callculate...</div></td>
				<td style="text-align: top"></td>
			</tr>
		</table>
		<table width="1000px;">
			<tr width="1000px"><td width="600px;">请输入API地址：<textarea cols="120" width="500px;" rows="1" id="requestUrl">http://10.5.83.166:8080/ctdss01/ExcelRestServlet/dbtables/getroute?key=fe8f7d3ad3234627a3e0562eaf048672&dtype=xml&routename=1号线</textarea></td>
			<td><input type="button" value="调用接口" onclick="show()"/></td></tr>
			<tr>
				<td>请选择地铁线：<select name="routname" id="routname">
					<option>1号线</option>
					<option>八通线</option>
					<option>6号线</option>
					<option>昌平线</option>
					<option>S1北线</option>
					<option>大兴线</option>
					<option>S1南线</option>
					<option>5号线</option>
					<option>机场线</option>
					<option>4号线</option>
					<option>8号线</option>
					<option>15号线</option>
					<option>2号线</option>
					<option>14号线</option>
					<option>9号线</option>
					<option>房山线</option>
					<option>亦庄线</option>
					<option>7号线</option>
					<option>10号线</option>
					<option>13号线</option>
				    </select></td>
				<td>
				</td>
			</tr>
			<tr>
				<td>数据格式：<h4><a id="xml" target="_blank">xml</a></h4><h4><a id="json" target="_blank">json</a></h4></td>
				<td>
				</td>
			</tr>
			<!-- <tr>
				<td>Choose Your Favourite(Optional)</td>
				<td><select name="listfilename" id="listFileName"></select></td>
				<td>
				</td>
				<td><input type="button" value="show" onclick="show()">
				</td>
			</tr> -->
		</table>
		<!-- <form action="" onSubmit="calcRoute();return false;" id="routeForm">
			<div>
				<div>
					<label> Start: <br /> <input type="text" id="routeStart" value=""> </label> <label> <br />End: <br /> <input type="text" id="routeEnd" value="">
					</label>
				</div>
				<div>
					<label>Travel mode:</label> <label><input type="radio" name="travelMode" value="DRIVING" checked /> Driving</label> <label><input type="radio"
						name="travelMode" value="TRANSIT" /> Public transport</label> <label><input type="radio" name="travelMode" value="WALKING" /> Walking</label>
				</div>
			</div>
			<input type="submit" value="Calculate route">
		</form>

		<div id="directionsPanel">Enter a destination and click "Calculate route".</div>

		<div id="r-result"></div>
		<div id="Div1">
			<div>
				<div class="sel_container">
					<strong id="curCity">City</strong> [<a id="curCityText" href="javascript:void(0)">Change</a>]
				</div>
				<div class="map_popup" id="cityList" style="display: none;">
					<div class="popup_main">
						<div class="title">City List:</div>
						<div class="cityList" id="citylist_container"></div>
						<button id="popup_close"></button>
					</div>
				</div>
			</div>
		</div> -->



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
	init();
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
	
	var myIcon = new BMap.Icon("test/Mario.png", new BMap.Size(32, 70), {    //小车图片
	    //offset: new BMap.Size(0, -5),    //相当于CSS精灵
	    imageOffset: new BMap.Size(0, 0)    //图片的偏移量。为了是图片底部中心对准坐标点。
	  });
	

	
	var count = 0;
	function show() {
		var routename= $("#routname").val();
		$("#msg").html("【地铁"+routename+"各站点】");
		//document.getElementById('wait').style.visibility = "hidden";
		map.clearOverlays();
		//var listfilename = document.getElementById("listFileName").value;
		//var serviceID = document.getElementById("serviceID").value;
		//var option = document.getElementById("serviceID");
		//var servicename = option.options[option.selectedIndex].text;

		//generate(serviceID, listfilename, servicename);
		var fileurl="/ctdss01/ExcelRestServlet/dbtables/getroute?key=fe8f7d3ad3234627a3e0562eaf048672&dtype=xml&routename="+routename;
		var fileurl2="http://10.5.83.166:8080"+fileurl;
		$("#requestUrl").html(fileurl2);		
		/* if (listfilename == "choose") {
			fileurl = "/xml/zuhe/" + servicename + ".xml";
		} else {
			fileurl = "/xml/show/" + listfilename + ".xml";
		} */
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
						
						//var address = eachMarker.find("address").text();
						//var content = eachMarker.find("content").text();
						//var english_menu = eachMarker.find("english_menu").text();
						var html;
						if(index==1){
							html = "<div class='info-blob'>" + "<h3>" + name
							+ "</h3>起/终点：" + address + "<br />是否中转站：" + istopresult
							+ "<br /></div>";
						}else if(index==sum){
							html = "<div class='info-blob'>" + "<h3>" + name
							+ "</h3>起/终点：" + address + "<br />是否中转站：" + istopresult
							+ "<br /></div>";
						}else{
							html = "<div class='info-blob'>" + "<h3>" + name
							+ "</h3>站点"+index +"："+ address + "<br />是否中转站：" + istopresult
							+ "<br /></div>";
						}
						
						check(html, address, name,index);
						
					});
			
		});
		
		/* if (count < 2) {
			document.getElementById('wait').style.visibility = "visible";
			window.setTimeout("show()", 5000);
		} */
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
				
				/* if(index==1){
					myP1=pointMarker;
					carMk= new BMap.Marker(pointMarker,{icon:myIcon});
			        map.addOverlay(carMk);
			        var infowindow = new BMap.InfoWindow(html); // 创建信息窗口对象
					carMk.setAnimation(BMAP_ANIMATION_DROP); //坠落的动画
					carMk.addEventListener("click", function() {
						carMk.openInfoWindow(infowindow, pointMarker);
						document.getElementById("routeEnd").value = name.replace(
								/<[\/\!]*?[^<>]*?>/g, "");
					});
				}else{
					myP2=pointMarker;
					carMk = new BMap.Marker(pointMarker);
					map.addOverlay(carMk);
					var infowindow = new BMap.InfoWindow(html); // 创建信息窗口对象
					carMk.setAnimation(BMAP_ANIMATION_DROP); //坠落的动画
					carMk.addEventListener("click", function() {
						carMk.openInfoWindow(infowindow, pointMarker);
						document.getElementById("routeEnd").value = name.replace(
								/<[\/\!]*?[^<>]*?>/g, "");
					carMk.setPosition(pointMarker);
					});  */
					
				/* 	function resetMkPoint(marker){
			            carMk.setPosition(marker);
			        } */
				document.getElementById('wait').style.visibility = "hidden";
			       /*  var driving2 = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});    //驾车实例
			        driving2.search(myP1, myP2);    //显示一条公交线路 */
				}
		}, "北京");
	}
	
	function show1(){
		
	}
	
	function selectClick() {
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = initSelectName;
		xmlhttp.open("GET", "serlet/login?service=user", true);
		xmlhttp.send();
	}

	function initSelectName() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				var oList = document.getElementById("listFileName");
				var fileNameText = xmlhttp.responseText.toString();
				fileNameText = fileNameText.substr(0, fileNameText.length - 1);
				var fileNames = fileNameText.split("?");
				for ( var i = 0; i != fileNames.length; ++i) {
					var oOpt = new Option();
					oOpt.value = fileNames[i];
					oOpt.text = fileNames[i];
					oList.options[i] = oOpt;
				}
			}
		}
	}

	function selectService() {
		if (window.XMLHttpRequest) {
			xmlhttp2 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			try {
				xmlhttp2 = new ActiveXObject("MSXML2.XMLHTTP");
			} catch (e) {
				try {
					xmlhttp2 = new ActiveXObject("Mircsoft.XMLHTTP");
				} catch (e1) {
				}
			}
		}
		xmlhttp2.onreadystatechange = initSelectService;
		xmlhttp2.open("GET", "RegisterServlet?service=getService", true);
		xmlhttp2.send();
	}

	function initSelectService() {
		if (xmlhttp2.readyState == 4) {
			if (xmlhttp2.status == 200) {
				var oList = document.getElementById("serviceID");
				var serviceText = xmlhttp2.responseText.toString();
				var services = serviceText.split("*??*");
				for ( var i = 0, j = 0; i < services.length; j++) {
					var oOpt = new Option();
					oOpt.text = services[i];
					oOpt.value = services[i + 1];
					oList.options[j] = oOpt;
					i = i + 2;
				}
			}
		}
	}

	function calcRoute() {
		var travelMode = $('input[name="travelMode"]:checked').val();
		var start = $("#routeStart").val();
		var end = $("#routeEnd").val();
		var start = $("#routeStart").val();
		map.clearOverlays();
		if (travelMode == 'WALKING') {
			var walking = new BMap.WalkingRoute(map, {
				renderOptions : {
					map : map,
					panel : "r-result",
					autoViewport : true
				}
			});
			walking.search(start, end);
		} else if (travelMode == 'DRIVING') {
			var driving = new BMap.DrivingRoute(map, {
				renderOptions : {
					map : map,
					panel : "r-result",
					autoViewport : true
				}
			});
			driving.search(start, end);
		} else if (travelMode == 'TRANSIT') {
			var transit = new BMap.TransitRoute(map, {
				renderOptions : {
					map : map,
					panel : "r-result"
				}
			});
			transit.search(start, end);
		}
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