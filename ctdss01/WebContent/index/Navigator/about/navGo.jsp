<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<link rel="stylesheet" href="index/css/navigator.css">
	<link rel="stylesheet" type="text/css" href="index/css/head_menu.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/CityList/1.2/src/CityList_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	<title>navGo v1.3 </title>		
</head>

<body>
	<div class="forshowfooter1">
	
<jsp:include page="/public/head1.jsp"></jsp:include>
	<div class="forshowfooter2">
	<table>
	<tr>
	<td>	
	<div id="map" style="width:700px; height:550px">
		Callculate...
	</div>
	</td>
	<td style="text-align:top">
	</td>
	</tr>
	</table>
	<table>
		<tr>
			<td>Choose Service(Necessary)</td>
			<td>
			    <select name="serviceID" id="serviceID" onclick="count();"></select>
			</td>
		</tr>
		<tr>
			<td>Choose Your Favourite(Optional)</td>
			<td>
				<select name="listfilename" id="listFileName"></select>
			</td>
			<td><div id="wait"><img src="index/images/wait.gif"></div></td>
			<td><input type="button" value="show" onclick="show()"></td>
		</tr>
	</table>
	
	<form action="" onSubmit="calcRoute();return false;" id="routeForm">
		<div>
			<div>
				<label>
					Start: <br />
					<input type="text" id="routeStart" value="">
				</label>
				<label>
					<br />End: <br />
					<input type="text" id="routeEnd" value="">
				</label>
			</div>
			<div>
				<label>Travel mode:</label>
				<label><input type="radio" name="travelMode" value="DRIVING" checked /> Driving</label>
				<label><input type="radio" name="travelMode" value="TRANSIT" /> Public transport</label>
				<label><input type="radio" name="travelMode" value="WALKING" /> Walking</label>
			</div>
		</div>
		<input type="submit" value="Calculate route">
	</form>
		
	<div id="directionsPanel">
		Enter a destination and click "Calculate route".
	</div>
		
	<div id="r-result"></div>
	<div id="Div1">
		<div >
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
</body>

		<script type="text/javascript">
		var map,geocoder, point, addresslat, addresslng, xmlhttp, xmlhttp2;
		selectClick();
		selectService();
		init();
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
		document.getElementById('wait').style.visibility="hidden";
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
			function count(){
				count = 0;
			}

			//搜索 
			function check(html,searchTxt,name) {
				map.clearOverlays();
				// 创建地址解析器实例 
				var myGeo = new BMap.Geocoder();
				// 将地址解析结果显示在地图上，并调整地图视野 
				myGeo.getPoint(searchTxt, function(point) {
					if (point) {
						map.centerAndZoom(point, 12);
						var pointMarker = new BMap.Point(point.lng, point.lat);
						var marker = new BMap.Marker(pointMarker);
						map.addOverlay(marker);
						var infowindow = new BMap.InfoWindow(html); // 创建信息窗口对象
						marker.setAnimation(BMAP_ANIMATION_DROP); //坠落的动画
						marker.addEventListener("click", function() {
							marker.openInfoWindow(infowindow,pointMarker);
							document.getElementById("routeEnd").value = name.replace(/<[\/\!]*?[^<>]*?>/g,"");
						});
						document.getElementById('wait').style.visibility="hidden";
					}
				}, "全国");
			}
			
			var count=0;
			function show() {
				count++;
				document.getElementById('wait').style.visibility="hidden";
				map.clearOverlays();
				var listfilename = document.getElementById("listFileName").value;
				var serviceID = document.getElementById("serviceID").value;
				var option =document.getElementById("serviceID");
				var servicename = option.options[option.selectedIndex].text; 
				
				generate(serviceID,listfilename,servicename);
				var fileurl;
				if (listfilename == "choose") {
					fileurl = "/xml/zuhe/" + servicename + ".xml";
				} 
				else {
					fileurl = "/xml/show/" + listfilename + ".xml";
				}
				jQuery.get(fileurl,function(data) {
							jQuery(data).find("marker").each(function() {
															var eachMarker = jQuery(this);
															var name = eachMarker.find("name").text();
															var address = eachMarker.find("address").text();
															var content = eachMarker.find("content").text();
															var english_menu = eachMarker.find("english_menu").text();
															var html = "<div class='info-blob'>"
																	+ "<h3>"
																	+ name
																	+ "</h3>"
																	+ address
																	+ "<br />"
																	+ content
																	+ "<br />"
																	+ english_menu
																	+ "</div>";
															check(html,address,name);
														});
								});
				if(count<2){
					document.getElementById('wait').style.visibility="visible";
					window.setTimeout("show()", 5000);
				}

			}
			
			function selectClick() {
				if (window.XMLHttpRequest) {
					xmlhttp = new XMLHttpRequest();
				} else {
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange = initSelectName;
				xmlhttp.open("GET", "serlet/login?service=user",true);
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
			
			function selectService()
			{
			    if(window.XMLHttpRequest){
			    	xmlhttp2 = new XMLHttpRequest();
			     }else if(window.ActiveXObject){
			        try{
			        	xmlhttp2 = new ActiveXObject("MSXML2.XMLHTTP");
			        }catch(e){
			            try{
			            	xmlhttp2 = new ActiveXObject("Mircsoft.XMLHTTP");
			            }catch(e1){}
			        }
			     }
			    xmlhttp2.onreadystatechange = initSelectService;
			    xmlhttp2.open("GET", "RegisterServlet?service=getService", true);       
			    xmlhttp2.send();	
			}
			
			function initSelectService()
			{
				if(xmlhttp2.readyState == 4)
				{
			        if(xmlhttp2.status == 200)
			        {
			            var oList=document.getElementById("serviceID");
			            var serviceText = xmlhttp2.responseText.toString();
			            var services = serviceText.split("*??*");
			            for(var i=0,j=0;i<services.length;j++)
			            {
			                var oOpt=new Option();
			                oOpt.text = services[i];
			                oOpt.value = services[i+1];
			                oList.options[j] =  oOpt;
			                i=i+2;
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
				if(travelMode == 'WALKING'){
					var walking = new BMap.WalkingRoute(map, {renderOptions:{map: map,  panel: "r-result", autoViewport: true}});
					walking.search(start, end);
				}else if(travelMode == 'DRIVING'){
					var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map,  panel: "r-result", autoViewport: true}});
					driving.search(start, end);
				}else if(travelMode == 'TRANSIT'){
					var transit = new BMap.TransitRoute(map, {
						  renderOptions: {map: map, panel: "r-result"}
						});
						transit.search(start, end);
				}
			}
			
			var XMLHttpReq;
			function createXMLHttpRequest(){
			    if(window.XMLHttpRequest){
			       XMLHttpReq = new XMLHttpRequest();
			    }else if(window.ActiveXObject){
			       try{
			           XMLHttpReq = new ActiveXObject("MSXML2.XMLHTTP");
			       }catch(e){
			           try{
			              XMLHttpReq = new ActiveXObject("Mircsoft.XMLHTTP");
			           }catch(e1){}
			       }
			    }
			}
			function sendRequest(url) {
				createXMLHttpRequest();
				XMLHttpReq.open("POST", "RegisterServlet", true);
				XMLHttpReq.onreadystatechange = processResponse;
				XMLHttpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
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
			function generate(serviceID,listfilename,servicename){
				sendRequest("&time="+new Date().getTime()+"&service=generate&serviceID="+serviceID
						+"&listfilename="+listfilename+"&servicename="+servicename);
			}
		</script>
</html>