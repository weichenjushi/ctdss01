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
	function getparms() {
		var href="<%=basePath%>APIServlet?method=getparms&dtname="+document.getElementById("tname3").value;
		window.location.href=href;
		
	}
	function getDtNameofparms() {
		var href="<%=basePath%>APIServlet?method=getDtNameofparms";
		window.location.href=href;
	
	}
    /* function setCookie(name, value) {
        var exp = new Date();
        exp.setTime(exp.getTime() + 24*60*60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }
    function getCookie(name)
    {
        var regExp = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        var arr = document.cookie.match(regExp);
        if (arr == null) {
            return null;
        }
        return unescape(arr[2]);
    } */
    $(document).ready(function(){
//     	$("#tname3").blur(function(){
//     		var v=$("#tname3").val();
//     		$("#showtext").html("您选择了数据表："+v);
    		
//     	})
    })
</script>
</head>
<body>

	<form action="<%=basePath%>APIServlet?method=addparms" method="post">
		<center>
			<table width="50%" border="0" cellspacing="0" cellpadding="0" class="bg_tb" >
				<caption>App参数添加页面</caption>
				
				<tr class="tr_title">
					<td colspan="2">请选择表名：<select name="tname" id="tname3" ondblclick="getDtNameofparms()" onblur="getparms()" >	
							<c:forEach var="getDtNameofret" items="${getDtNameofretparms}">
								<option value="${getDtNameofret}">${getDtNameofret}</option>
							</c:forEach>
							
					</select>
					<p id="showtext"></p>
				<!-- 	<script type="text/javascript">
   				 var selectedIndex = getCookie("tname3");
    				if(selectedIndex != null) {
        			document.getElementById("tname3").selectedIndex = selectedIndex;
   				 }
		</script> -->
					</td>
				</tr>
				<%-- <%
							for (Entry<String, String> entry:${addressMap}.entrySet()) 
							{String key = entry.getKey();
							System.out.println(entry.getValue());
							String[] values = entry.getValue().split("/");
							String value1=values[0];
							System.out.println(values);
							String value2=values[1]; 
							%> --%>
				<c:forEach var="addressMap" items="${addressMaps}">
				<tr class="tr_content">
					<td><input type="text"  value="${addressMap.key}" disabled="disabled"> </td>
					<td><input type="text" name="${addressMap.key}" value="${addressMap.value}" > </td>					
				</tr>
				
				</c:forEach>
				
				<tr class="tr_content">
					<td><input type="submit" value="添加"> </td>		
				</tr>
			</table>
		</center>
	</form>
</body>
</html>