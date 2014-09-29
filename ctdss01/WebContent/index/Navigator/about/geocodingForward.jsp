<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="index/css/navigator.css">
	<link rel="stylesheet" href="index/css/head_menu.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/CityList/1.2/src/CityList_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	<script type="text/javascript" src="index/Navigator/js/form.js"></script>
	<title>NavGo v1.3 Forward Geocoding</title>
</head>

<body>
	<div class="forshowfooter1">
	<jsp:include page="/public/head1.jsp"></jsp:include>
	<div class="forshowfooter2">
	<table id="form">
		<tr>
			<td>Choose</td>
			<td>
				<select name="listfilename" id="listFileName" onfocus="selectClick();"></select>
			</td>
		</tr>
		<tr>
			<td>FileName</td>
			<td><input type="text" name="fileName" id="fileName" /></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input name="Servienames" type="text" value="" id="servicename"></td>
		</tr>
		
		<tr>
			<td>Address</td>
			<td><input type="text" name="addresse" id="addressbox" disabled></td>
		</tr>

		<tr>
			<td>Latitude</td>
			<td><input name="Lat" type="text" value="automaticly" id="lat" size"50" maxlength"50" disabled></td>
		</tr>

		<tr>
			<td>Longitude</td>
			<td><input name="Lng" type="text" value="automaticly" id="lng" size"50" maxlength"50" disabled></td>
		</tr>

		<tr>
			<td>Informations</td>
			<td><textarea name="information" id="textarea" ></textarea></td> 
		</tr>
		<tr>
			<td><input type="button" value="Reset Map" id="changeValues"></td>
			<td>
				<input type="reset" value="Reset Form" onclick="reset();"> 
				<input type="button" value="Save" onclick="writes();">
			</td>
		</tr>
	</table>

	<form id="addressForm">
		<div class="addressform">
		    <label>Address:</label>
			<input type="text" name="address" id="address" />
			<input type="button" id="addressButton" value="Check" onclick="check();"/>
			<input type="button" id="fillButon" value="Fill" onclick="fill();"/>
		</div>
	</form>
	
	<div id="map"></div>
	
	<div style="width: 100%;" id="Div1">
		<div class="show_place">
			<div class="sel_container">
				<strong id="curCity">City</strong> [<a id="curCityText"
					href="javascript:void(0)">Change</a>]
			</div>
			<div class="map_popup" id="cityList" style="display: none;">
				<div class="popup_main">
					<div class="title">City List:</div>
					<div class="cityList" id="citylist_container"></div>
					<button id="popup_close"></button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="/public/footer.jsp"></jsp:include>
	</div>	
	<script type="text/javascript">
		var geocoder, point, addresslat, addresslng;
		selectClick();
		var map = new BMap.Map("map");
		map.centerAndZoom(new BMap.Point(116.404, 39.915), 10);
		map.enableScrollWheelZoom();
		map.addControl(new BMap.NavigationControl());
		map.addControl(new BMap.ScaleControl());
		map.addControl(new BMap.OverviewMapControl());
		map.addControl(new BMap.MapTypeControl());
		//搜索 
		function check() {
			map.clearOverlays();
			// 创建地址解析器实例 
			var myGeo = new BMap.Geocoder();
			var searchTxt = document.getElementById("address").value;
			// 将地址解析结果显示在地图上，并调整地图视野 
			myGeo.getPoint(searchTxt, function(point) {
				if (point) {
					
					map.centerAndZoom(point, 16);
					var pointMarker = new BMap.Point(point.lng, point.lat);
					addresslat = point.lat;
					addresslng = point.lng;
					alert(addresslat);
					alert(addresslng);
					geocodeSearch(pointMarker);
					map.addOverlay(new BMap.Marker(point));
				} else
					alert("搜索不到结果");
			}, "全国");
		}
		function fill() {
			document.getElementById('addressbox').value = document
					.getElementById("address").value;
			document.getElementById('lat').value = addresslat;
			document.getElementById('lng').value = addresslng;
		}
		// 创建CityList对象，并放在citylist_container节点内 
		var myCl = new BMapLib.CityList({
			container : "citylist_container",
			map : map
		});
		// 给城市点击时，添加相关操作 
		myCl.addEventListener("cityclick", function(e) {
			// 修改当前城市显示 
			document.getElementById("curCity").innerHTML = e.name;
			// 点击后隐藏城市列表 
			document.getElementById("cityList").style.display = "none";
		});
		// 给“更换城市”链接添加点击操作 
		document.getElementById("curCityText").onclick = function() {
			var cl = document.getElementById("cityList");
			if (cl.style.display == "none") {
				cl.style.display = "";
			} else {
				cl.style.display = "none";
			}
		};
		// 给城市列表上的关闭按钮添加点击操作 
		document.getElementById("popup_close").onclick = function() {
			var cl = document.getElementById("cityList");
			if (cl.style.display == "none") {
				cl.style.display = "";
			} else {
				cl.style.display = "none";
			}
		};
		function geocodeSearch(pt) {
			var myGeo = new BMap.Geocoder();
			myGeo.getLocation(pt, function(rs) {
				var addComp = rs.addressComponents;
				document.getElementById("textarea").value = addComp.province
						+ ", " + addComp.city + ", " + addComp.district;
			});
		}
		function writes() {
			var listfilename = document.getElementById("listFileName").value;
			var fileName = document.getElementById("fileName").value;
			var Servienames = document.getElementById("servicename").value;
			var addresse = document.getElementById("addressbox").value;
			var Lat = document.getElementById("lat").value;
			var Lng = document.getElementById("lng").value;
			var information = document.getElementById("textarea").value;
			var url = "listfilename=" + listfilename
					+ "&fileName=" + fileName + "&Servienames=" + Servienames
					+ "&addresse=" + addresse + "&Lat=" + Lat + "&Lng=" + Lng
					+ "&information=" + information;

			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = saveName;
			xmlhttp.open("POST", "serlet/login", true);
			xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlhttp.send(url);
		}

		function saveName() {

		}

		function selectClick() {
			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = initSelectName;
			xmlhttp.open("get", "serlet/login?service=user", true);
			xmlhttp.send();
		}

		function initSelectName() {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					var oList = document.getElementById("listFileName");
					var fileNameText = xmlhttp.responseText.toString();
					fileNameText = fileNameText.substr(0,
							fileNameText.length - 1);
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
</script>
</body>
</html>