<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	function checkfilepath() {
		var filepath = document.getElementById("myfile");
		var content = filepath.value;
		
		var patten1 = /^[C|D|E|F|G|H]:\\.+/;
		var patten2 = /\b.csv/g;
		var patten3 = /\b.xls/g;
		var patten4 = /\b.xlsx/g;
		if (content == "") {
			alert("文件路径不能为空!");
			filepath.focus();
			return false;
		} 
		else {
			if (patten2.test(content) || patten3.test(content)|| patten4.test(content)) {
				if (!patten1.test(content)) {
					alert("请输入正确的文件路径!");
					filepath.focus();
					return false;
				}
			} else {
				alert("请输入正确的文件路径!");
				filepath.focus();
				return false;
			}
		}
	}
	function checkdtname() {
		var dtname = document.getElementById("dtname");
		var content = dtname.value;
		
		var patten1 = /\bt_/g;
		if (content == "") {
			alert("数据库表名不能为空!");
			dtname.focus();
			return false;
		} 
		else {
				if (!patten1.test(content)) {
					alert("请输入正确的数据库表名!");
					dtname.focus();
					return false;
				}
			 
		}
	}
	
</script>
</head>
<body>
	<div>
		<!-- <object width="100%"; height="600" data="AppBuilder.html"></object>  -->
		<form action="<%=basePath%>apps/addapp" method="post">
			<table width="65%" border="0" cellspacing="0" cellpadding="0" class="bg_tb">
				<tr class="tr_title">
					<td>数据表路径：(例如：D:\abc.csv或D:\abc.xls或D:\abc.xlsx)：<input type="text" name="filepath" id="myfile" onblur="checkfilepath()">
					</td>
				</tr>
				<tr class="tr_title">
					<td>数据表表名（必须是英文字母并且以t_开头，例：t_subway）：<input type="text" name="txtname" id="dtname" onblur="checkdtname()">
					</td>
				</tr>
				<tr class="tr_title">
					<td colspan="2"><input type="submit" value="导入数据表">
					</td>
				</tr>
			</table>

		</form>
	</div>

</body>
</html>