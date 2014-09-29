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
<script type="text/javascript" src="test/jquery.min.js"></script>
<script type="text/javascript">
	function getDtName() {
		var href="<%=basePath%>APIServlet?method=accessdtables";
		window.location.href=href;
	}
	function getCId() {
		var href="<%=basePath%>/appCateServlet?method=listallu";
		window.location.href=href;
	}
</script>
</head>
<body>
	<form action="<%=basePath%>apps/addnewapp" method="post">
		<center>
			<table width="50%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
				<caption>数据服务新增界面</caption>
				<tr class="tr_title">
					<td>数据服务种类：</td>
					<td><select name="cid" id="cid" ondblclick="getCId()"><c:forEach var="listacg" items="${listacgs}">
								<option value="${listacg.id}">${listacg.name}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr class="tr_title">
					<td>数据服务对应数据表名:</td>
					<td><select name="tname" id="tname" ondblclick="getDtName()"><c:forEach var="accessedtable" items="${accessedtables}">
								<option value="${accessedtable}">${accessedtable}</option>
							</c:forEach>
					</select></td>
				</tr>
				
				<tr class="tr_title">
					<td>数据服务归属城市：</td>
					<td><select name="ctid" id="ctid">
								<option value="bj" selected="selected">北京</option>
								<option value="sh">上海</option>
								<option value="js">江苏</option>
								<option value="gd">广东</option>
								<option value="xj">新疆</option>
								<option value="xz">西藏</option>
								<option value="gs">甘肃</option>
								<option value="qh">青海</option>
								<option value="sc">四川</option>
								<option value="nmg">内蒙古</option>
								<option value="nx">宁夏</option>
								<option value="sx1">陕西</option>
								<option value="sx2">陕西</option>
								<option value="cq">重庆</option>
								<option value="gz">贵州</option>
								<option value="gx">广西</option>
								<option value="hn">海南</option>
								<option value="am">澳门</option>
								<option value="xg">香港</option>
								<option value="tw">台湾</option>
								<option value="fj">福建</option>
								<option value="zj">浙江</option>
								<option value="ah">安徽</option>
								<option value="hn">河南</option>
								<option value="hb">河北</option>
								<option value="sd">山东</option>
								<option value="hn">湖南</option>
								<option value="hb">湖北</option>
								<option value="tj">天津</option>
								<option value="ln">辽宁</option>
								<option value="jl">吉林</option>
								<option value="hlj">黑龙江</option>
					</select>
					</td>
				</tr>
				<tr class="tr_title">
					<td>数据服务名称：</td>
					<td><input type="text" name="name" />
					</td>
				</tr>
				<tr class="tr_title">
					<td>数据服务描述：</td>
					<td><input type="text" name="description" />
					</td>
				</tr>
				<!-- <tr class="tr_title">
					<td>api接口地址：</td>
					<td><input type="text" name="apiaddress" />
					</td>
				</tr>
				<tr class="tr_title">
					<td>api说明文档：</td>
					<td><input type="text" name="apiexample" />
					</td>
				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>api返回xml数据格式：</td> -->
<!-- 					<td><textarea name="retexampxml" rows="5" cols="40"></textarea> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>api返回json数据格式：</td> -->
<!-- 					<td><textarea name="retexampjson" rows="5" cols="40"></textarea></td> -->
<!-- 				</tr> -->
				<tr>
					<td colspan="2">
					<td><input type="submit" value="新增" />
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>

</html>