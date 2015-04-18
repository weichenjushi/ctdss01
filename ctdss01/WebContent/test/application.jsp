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
// 		String urlAll = "http://10.5.80.2:8080/Rest/TrafficFlow/xml";
	    String urlAll = "http://10.5.83.166:8080/ctdss01/trafficFlowServlet/xml";
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
	var point = new BMap.Point(116.404, 39.915);
	map.centerAndZoom(point, 15);
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
	
	// 随机向地图添加25个标注
	var bounds = map.getBounds();
	var sw = bounds.getSouthWest();
	var ne = bounds.getNorthEast();
	var lngSpan = Math.abs(sw.lng - ne.lng);
	var latSpan = Math.abs(ne.lat - sw.lat);
	var vehicles="<%=vehicles%>";
	var vehicle=vehicles.split(",");
	for ( var i = 0; i < 25; i++) {
		point1 = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7),
				ne.lat - latSpan * (Math.random() * 0.7));
		addMarker(point1, "车流量："+vehicle[i]);
	}
	
</script>
</html>
