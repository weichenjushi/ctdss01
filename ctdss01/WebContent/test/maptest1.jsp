<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.net.*,org.dom4j.Document,org.dom4j.DocumentException,org.dom4j.DocumentHelper,org.dom4j.Element,java.util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="refresh"content="2">  
<style type="text/css">
body,html {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
}
#allmap{
	width: 95%;
	height: 80%;
	overflow: hidden;
	margin: 0;
}
#top{
	width: 60%;
	height: 10%;
	margin:auto;
	padding:auto;
	margin-top:20px;
	color: blue;
}
#l-map {
	height: 100%;
	width: 78%;
	float: left;
	border-right: 2px solid #bcbcbc;
}

#r-result {
	height: 100%;
	width: 20%;
	float: left;
}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=GGoD6Lzosi7cLoeGC0KAj55I"></script>
<title>车流量数据服务测试Example</title>

</head>
<body>
	<%
// 		 String urlAll = "http://10.5.80.2:8080/Rest/TrafficFlow/xml";
		String urlAll = "http://10.5.80.31:8080/ctdss01/trafficFlowServlet/xml";
		String charset = "UTF-8";
		
		BufferedReader reader = null;
		String result = null;
		StringBuffer sbf = new StringBuffer();
		String userAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";// 模拟浏览器
		URL url = new URL(urlAll);
		HttpURLConnection connection = (HttpURLConnection) url
				.openConnection();
		connection.setRequestMethod("GET");
		connection.setReadTimeout(30000);
		connection.setConnectTimeout(30000);
		connection.setRequestProperty("User-agent", userAgent);
		connection.connect();
		InputStream is = connection.getInputStream();
		reader = new BufferedReader(new InputStreamReader(is, charset));
		String strRead = null;
		while ((strRead = reader.readLine()) != null) {
			sbf.append(strRead);
			sbf.append("\r\n");
		}
		reader.close();
		result = sbf.toString();
		Document dom =DocumentHelper.parseText(result);
		//3.获取根节点
		Element root = dom.getRootElement();
		String rootext = dom.getRootElement().getText();
		//4.获取书名进行打印
		//String root1 = root.element("root").;
		List<Element> list=root.elements();
		String vehicles="123";
		String time="";
		StringBuilder sbd=new StringBuilder();
		for(int i=0;i<25;i++){
			Element child=list.get(i);
// 			System.out.println("时间戳:"+child.element("timestamp").getText());
// 			System.out.println("监测点:"+child.element("monitorpoint").getText());
// 			System.out.println("车流量:"+child.element("vehicles").getText());
			sbd.append(child.element("vehicles").getText()).append(",");
			time=child.element("timestamp").getText();
		}
		vehicles=sbd.toString();
// 		System.out.print(vehicles);
// 		System.out.println(list.size());
// 		System.out.println(root);
// 		System.out.println(rootext);
		
	%>
	<div id="top">时间戳为：<%=time%> 时刻的各监测点的车流量</div>
	<div id="allmap"></div>
</body>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.213474,39.93349);
	map.centerAndZoom(point, 50);
	
	
	// 随机向地图添加25个标注
	var bounds = map.getBounds();
	var sw = bounds.getSouthWest();
	var ne = bounds.getNorthEast();
	var lngSpan = Math.abs(sw.lng - ne.lng);
	var latSpan = Math.abs(ne.lat - sw.lat);
	var vehicles="<%=vehicles%>";
	var vehicle=vehicles.split(",");
// 	for ( var i = 0; i < 25; i++) {
// 		point1 = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7),
// 				ne.lat - latSpan * (Math.random() * 0.7));
// 		addMarker(point1, "车流量："+vehicle[i]);
// 	}
	var point0=new BMap.Point(116.213474,39.93349);
	addMarker(point0, "车流量："+vehicle[0]);
	var point1=new BMap.Point(116.211249,39.933449);
	addMarker(point1, "车流量："+vehicle[1]);
	//alert(vehicle[1]);
	var point2=new BMap.Point(116.208545,39.933497);
	addMarker(point2, "车流量："+vehicle[2]);
	var point3=new BMap.Point(116.21654,39.933414);
	addMarker(point3, "车流量："+vehicle[3]);
	var point4=new BMap.Point(116.218615,39.933387);
	addMarker(point4, "车流量："+vehicle[4]);
	var point5=new BMap.Point(116.2138,39.934991);
	addMarker(point5, "车流量："+vehicle[5]);
	var point6=new BMap.Point(116.213439,39.932792);
	addMarker(point6, "车流量："+vehicle[6]);
	var point7=new BMap.Point(116.213605,39.932259);
	addMarker(point7, "车流量："+vehicle[7]);
	var point8=new BMap.Point(116.213605,39.932259);
	addMarker(point8, "车流量："+vehicle[8]);
	var point9=new BMap.Point(116.210126,39.933511); 
	addMarker(point9, "车流量："+vehicle[9]);
	//alert(vehicle[9]); 
// 	var pointString="point";
// 	for(var i=0;i<2;i++){
// 		alert(pointString+i);
// 		addMarker(pointString+i, "车流量："+vehicle[i]);
// 		addMarker(point1, "车流量："+vehicle[i]);
		
// 		alert(vehicle[i]);
// 	}
	// 编写自定义函数,创建标注
	function addMarker(point, i) {
		var marker = new BMap.Marker(point);
		map.addOverlay(marker);

		var opts = {
			position : point, // 指定文本标注所在的地理位置
			offset : new BMap.Size(30, -30)
		//设置文本偏移量

		}
		var label = new BMap.Label(i, opts); // 创建文本标注对象
		label.setStyle({
			color : "red",
			fontSize : "12px",
			height : "20px",
			lineHeight : "20px",
			fontFamily : "微软雅黑"
		});
		map.addOverlay(label);
	}
</script>
</html>
