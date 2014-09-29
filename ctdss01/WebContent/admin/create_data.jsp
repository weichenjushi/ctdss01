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
<title>管理员后台中心</title>
<link rel="stylesheet" type="text/css" href="test/admin1.css">
<script type="text/javascript">
    function getDtName() {
		var href="<%=basePath%>APIServlet?method=accessdtblbycxml";
		window.location.href=href;
	}
	function createXML() {
		var href="<%=basePath%>/Createdata?method=createxml&dtname="+document.getElementById("tname1").value;
		window.location.href=href;
	}
	function createAllXML() {
		var href="<%=basePath%>/Createdata?method=createallxml";
		window.location.href=href;
	}
	function getDtNameofretxml() {
		var href="<%=basePath%>APIServlet?method=getDtNameofretxml";
		window.location.href=href;
	}
	function updateretxml() {
		var href="<%=basePath%>/Createdata?method=updateretxml&dtname="+document.getElementById("tname2").value;
		window.location.href=href;
	}
	function updateretjson() {
		var href="<%=basePath%>/Createdata?method=updateretjson&dtname="+document.getElementById("tname3").value;
		window.location.href=href;
	}
	function getCId() {
		var href="<%=basePath%>appCateServlet?method=listallu";
		window.location.href = href;
	}
</script>
</head>
<body>
	<form action="<%=basePath%>appCateServlet?method=add" method="post">
		<center>
			<table width="70%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
				<caption>数据生成页面</caption>
				<tr class="tr_title">
					<td>请选择表名：<select name="tname" id="tname1" ondblclick="getDtName()"><c:forEach var="accessedtable" items="${accessedtables}">
								<option value="${accessedtable}">${accessedtable}</option>
							</c:forEach>
					</select>
					</td>
					<td><input type="button" value="生成xml文件" onclick="createXML()" />
					</td>
				</tr>
				<tr class="tr_title">
					<td>请选择表名：<select name="tname" id="tname2" ondblclick="getDtNameofretxml()"><c:forEach var="getDtNameofret" items="${getDtNameofretxml}">
								<option value="${getDtNameofret}">${getDtNameofret}</option>
							</c:forEach>
					</select>
					</td>
					<td><input type="button" value="将该数据表对应的数据服务的返回xml数据格式更新到数据库中" onclick="updateretxml()"/>
					</td>
				</tr>
				<tr class="tr_title">
					<td>请选择表名：<select name="tname" id="tname3" ondblclick="getDtNameofretxml()"><c:forEach var="getDtNameofret" items="${getDtNameofretxml}">
								<option value="${getDtNameofret}">${getDtNameofret}</option>
							</c:forEach>
					</select>
					</td>
					<td><input type="button" value="将该数据表对应的数据服务的返回json数据格式更新到数据库中" onclick="updateretjson()"/>
					</td>
				</tr>
				<tr class="tr_title">
					<td colspan="2">
					<input type="button" value="一键初始化数据服务" onclick="createAllXML()"/>
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>