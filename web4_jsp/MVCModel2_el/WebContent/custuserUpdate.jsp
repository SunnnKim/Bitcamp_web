<%@page import="dto.CustUserDto"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
td{
	padding: 10px;
}
th, td{
	text-align: center;
}
</style>
</head>
<body>
<h1 align="center">Customer Info Update</h1>


<div align="center">

<form action="custuserupdate">
<input type="hidden" name="command" value="db">
<table>
	<col width="100">
	<col width="300">
	<tr>
		<td colspan="2" height="1" bgcolor="#00000"></td>
	</tr>
	<tr>
		<th>ID</th>
		<td>
			<input type="text" size="30" value="${param.id}" disabled="disabled">
			<input type="hidden" name="id" value="${param.id}">
			
		</td>
	</tr>
	<tr>
		<th>NAME</th>
		<td>
			<input type="text" size="30" value="${param.name}"  disabled="disabled"> 
		</td>
	</tr>
	<tr>
		<th>ADDRESS</th>
		<td>
			<input type="text" name="address" id="add" size="30" value="${param.address}"> 
			<input type="hidden" name="address" value="${param.address}">
		</td>
	</tr>
	<tr>
		<td colspan="2" height="1" bgcolor="#00000"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정하기"> 
			<button type="button" onclick="back()" style="width:80px">뒤로가기</button>
		</td>
	</tr>

</table>
</form>

</div>


<script type="text/javascript">
function back() {
	location.href="custuserlist";
}

</script>

</body>
</html>