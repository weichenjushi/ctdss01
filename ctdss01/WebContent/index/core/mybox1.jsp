<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="cn.ctdss.lr.domain.AppsChild" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="index/css/core_css/dataservice.css">
<link rel="stylesheet" type="text/css" href="index/css/core_css/uhead_menu.css">
<link rel="stylesheet" type="text/css" href="test/ucenter.css">
<link rel="stylesheet" type="text/css" href="test/default.min.css">
<link rel="stylesheet" type="text/css" href="test/box.css">
<link rel="shortcut icon" type="image/x-icon" href="http://decloud.ncut.edu.cn/favicon.ico" />


<script type="text/javascript" src="test/htmlformat.js"></script>
<script type="text/javascript" src="test/jquery.min.js"></script>
<script type="text/javascript" src="test/jsformat.js"></script>
<script type="text/javascript" src="test/json.parse.js"></script>
<title>城市交通数据服务空间</title>
</head>
<body onload="initDataServices();initTService();">
	<div id="main" class="header" style="width:90%;margin:auto;padding:0;">
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
			<li class="lsss"><a href="index/core/profile.jsp">用户中心</a></li>
			<li class="lssss"><a href="logout.jsp">退出</a></li>
			<%
				}
			%>
		</ul>

		<div id="bd">
			<div class="juhe-box-main">
				<div class="juhe-box">
					<div class="juhe-box-left">
						<div class="juhe-box-tag">API测试工具</div>
						<div class="data-select">
							我的数据： ${appsChild.parentname}
							<input type="hidden" id="acname" value="${appsChild.param}">
						</div>
						<div class="data-appkey">
							APPKEY：&nbsp;<span class="values">${appsChild.appkey}</span> 
							<input type="hidden" name="url" id="url" value="${appsChild.apiaddress}">
							<input type="hidden" id="dtname" id="url" value="${appsChild.tname}">
						</div>

						<div class="data-line"></div>

						<div class="data-apis">
							接口列表： 
							<!-- <select name="apiid" id="apiid">
								<option value="82">身份证信息查询&nbsp;[idcard]</option>
								<option value="83">身份证泄漏查询&nbsp;[leak]</option>
								<option value="84">身份证挂失查询&nbsp;[loss]</option>
							</select> -->
							<%-- <select name="cid" id="cid" ondblclick="getCId()">
							<c:forEach var="listacg" items="${listacgs}">
								<option value="${listacg.id}">${listacg.name}</option>
							</c:forEach>
							</select> --%>
						</div>
						<div class="data-request-type">
							请求方式：<input type="radio" name="type" value="get" checked="checked"><span class="cutime">POST</span>&nbsp;
							<!-- <input type="radio" name="type" value="post"><span class="cutime">POST</span> -->
						</div>
						<div class="data-request-dtype">
							返回格式：<input type="radio" name="dtype" value="json" ><span class="cutime">JSON</span>&nbsp;<input type="radio" name="dtype" value="xml" checked="checked"><span
								class="cutime">XML</span>
						</div>
						<div class="data-api-link">
							API文档：&nbsp;&nbsp; <a href="apps/id/${app.id}" target="_blank" id="apiurl">点击获取文档</a>
						</div>

						<div class="data-params">
							<B>API参数:</B>
							<div class="params-main">
								<div>
									<%AppsChild appsChild=(AppsChild)session.getAttribute("appsChild");
									if(appsChild!=null){
								for (Entry<String, String> entry:appsChild.getParamsMap().entrySet()) {String key = entry.getKey();
								%>
							<input type="text" size="15"  disabled="disabled" name="paramname" value=<%=key%>>：<input id="_cardno" name="paramvalue" type="text" size="20" value="">
							
							<% }}%>
								
								</div>
							</div>
						</div>
						<div class="box-btn">
							<input type="button" value="调用接口" class="btnb" id="boxBtn">
							<!-- http://localhost:8080/ctdss01/ExcelRestServlet/dbtables/null?key=null -->
							
						</div>

					</div>
					<div class="juhe-box-right">
						<div class="request-content">
							请求：
							<div class="show">
								<div class="show-request-type"></div>
								<div class="show-request-url"></div>
								<div class="show-request-params"></div>
							</div>
						</div>
						<div class="response-content">
							返回的内容： <a href="index/core/create_mashup_traditional.jsp" target="_blank">常见问题</a>&nbsp;&nbsp;<a>|</a>&nbsp;&nbsp;<a href="apps/id/${app.id}" target="_blank">常见错误代码及释义</a>
							<!-- 
	    			<div class="show" id="show-reponse-content">
	    			</div> -->
							<textarea class="show" id="show-reponse-content"></textarea>
						</div>
					</div>


					<div class="clearfix"></div>
				</div>
			</div>
			<!-------Footer-------->
			<div class="clearfix"></div>
			
			<div style="margin-left:450px;paddin:auto;">Copyright © 2014 | <a href="index/about/about_us.jsp">关于我们</a> |<a href="index/about/feedback.jsp"> 反馈</a></div><!--/#ft --> 
			
		</div>
		<!--/#bd -->
		
	</div>
	<!--/#doc -->
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#boxBtn").click(function(){
		
		$("#boxBtn").val('请求中...').attr('disabled','disabled');
		$(".show-request-type,.show-request-params,.show-request-url").html('');
		$("#show-reponse-content").val('');
		var appkey = $(".values").html();
		//var apiid = $("#apiid").val();
		var requestUrl =$("#url").val();
		var requestType=$('input[name=type]:checked').val();
		var reponseDtype=$('input[name=dtype]:checked').val();
		var dtname=$("#dtname").val();
		
		var paramname="";
		$("input[name='paramname'").each(function(){
			paramname=paramname+$(this).val()+"/";
		 })
		 var paramvalue="";
		$("input[name='paramvalue'").each(function(){
			paramvalue=paramvalue+$(this).val()+"/";
		 })
		 var paraObj = {key:appkey,requestUrl:requestUrl,dtype:reponseDtype,requestType:requestType,paramname:paramname,paramvalue:paramvalue,dtname:dtname};
 		var paramlink="&";
 		var byte1=paramname.split("/");
 		var byte2=paramvalue.split("/");
 		for(var i=0;i<byte1.length-1;i++){
 			if(i>byte1.length-1){
 			}else {
 				if(i==byte1.length-2){
//  					alert(byte1.length-2);
 	 				paramlink+=byte1[i]+"="+byte2[i];}
 				else{
 					paramlink+=byte1[i]+"="+byte2[i]+"&";
 				}
 			}
 		}
		var url="<%=basePath%>ExcelRestServlet/dbtables/t_subway/";
		$.post(url,paraObj,function(e){
// 				var obj = json_parse(e);

				$(".show-request-type").html("请求方式："+requestType);
				$(".show-request-url").html("请求URL："+requestUrl);
				$(".show-request-params").html("请求参数：key="+appkey+"&dtype="+reponseDtype+paramlink);
				$("#show-reponse-content").val(e);
				$("#boxBtn").val('调用接口').removeAttr('disabled');
		})
		
		
	})
	
})


</script>
</html>

