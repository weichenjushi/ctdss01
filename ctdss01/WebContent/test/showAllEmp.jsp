<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>员工编号</td>
			<td>员工姓名</td>
			<td>员工所在部门</td>
			<td>操作</td>
		</tr>
		<c:forEach var="list" items="${list}">
		
			<tr>
				<td>${list.empno }</td>
				<td>${list.empname }</td>
				<td>${list.dept.depname }</td>
				<td><a href="QueryEmpById?empno=${list.empno }">修改</a> <a
					href="DeleteEmpById?empno=${list.empno }">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>