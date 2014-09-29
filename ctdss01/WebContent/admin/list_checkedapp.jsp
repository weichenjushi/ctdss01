<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="test/admin1.css">
<script type="text/javascript" src="test/jquery.min.js"></script>
<title>管理员后台中心</title>
<script type="text/javascript">
	
	function getbyplatid() {
		var href="CkappServlet/getbyplatid/"+document.getElementById("platid").value;
		window.location.href = href;
	}
</script>
</head>
<body>
	<div id="maincontent">
		<form>
			<center>
				<table width="98%" border="0" cellspacing="0" cellpadding="0" class="bg_tb">
				<tr class="tr_title">
				<td colspan="7">请选择应用平台：<select id="platid" onblur="getbyplatid()"><c:forEach var="appplat" items="${appplats}">
							<option value="${appplat.id}">${appplat.name}</option>
						</c:forEach>
				</select>
				</td>
			   </tr>
					<tr class="tr_title">
						<td>App名称</td>
						<td>App地址</td>
						<td>App描述</td>
						<td>App状态</td>
						<!-- 					<td>api接口地址</td> -->
						<td>使用数据服务</td>
						<td>用户名</td>
						<td>操作</td>
					</tr>
					<c:forEach var="ckappstock" items="${ckappstocks}">
						<tr class="tr_content">
							<td>${ckappstock.name}</td>
							<td>${ckappstock.address}</td>
							<td>${ckappstock.description}</td>
							<td>已认证</td>
							<%-- 						<td>${anapp.apiaddress}</td> --%>
							<td>${ckappstock.appid}</td>
							<td><a href="userServlet?method=getuinfobyname&uname=${ckappstock.myappuname}">${ckappstock.myappuname}</a></td>
							<td><a href="CkappServlet/unverified/${ckappstock.myappid}">设置为不通过</a>&nbsp;&nbsp;</td>
						</tr>
					</c:forEach>
					<%-- <tr class="tr_content">
						<td colspan="7" height="40" class="appPages"><a id="first">首页</a><a id="pre">上一页</a><a id="next">下一页</a><a id="final">最后一页</a> <a id="pagetext"></a><input type="hidden"
							id="hidepageindex1" value="${hidepageindex1}"> <input type="hidden" id="hidepagecount1" value="${hidepagecount1}">
						</td>

					</tr> --%>

				</table>
			</center>
		</form>
	</div>

</body>
<script type="text/javascript">
	var pageSize = 8;
	var pageCount = $("#hidepagecount1").val();;//总页数
	var currNo = 1;//当前页
	
	jQuery(document).ready(function() {
		$("#first").click(function() {
			$("#pagetext").text(1+"/"+pageCount);
			//var paraObj = {key:appkey,requestUrl:requestUrl,dtype:reponseDtype,requestType:requestType};
			//var url="apps/id/allnormalbypage";
			$.get("apps/id/allnormalbypage", {
				pageSize : pageSize,
				currNo : 1
			}, function(e) {
				$("#maincontent").html(e);
			})
			
		})
		$("#pre").click(function() {
			currNo = $("#hidepageindex1").val();
			$("#pagetext").text(currNo+"/"+pageCount);
			if (currNo <= 1) {
				currNo = 1;
			} else {
				currNo--;
				$("#pagetext").text(currNo+"/"+pageCount);
				$.get("apps/id/allnormalbypage", {
					pageSize : pageSize,
					currNo : currNo
				}, function(e) {
					//alert(e);
					$("#maincontent").html(e);
				})
			}
			
		})

		$("#next").click(function() {
			currNo = $("#hidepageindex1").val();
			$("#pagetext").text(currNo+"/"+pageCount);
			if(currNo>=pageCount)
				{
					currNo=pageCount;
				}
			else{
				currNo++;
				$.get("apps/id/allnormalbypage", {
					pageSize : pageSize,
					currNo : currNo
				}, function(e) {
					//alert(e);
					$("#maincontent").html(e);
				})
			}
		})
		$("#final").click(function() {
			$("#pagetext").text(currNo+"/"+pageCount);
			$.get("apps/id/allnormalbypage", {
				pageSize : pageSize,
				currNo : pageCount
			}, function(e) {
				$("#maincontent").html(e);
			})
			
		})
		
	})
	
</script>
</html>