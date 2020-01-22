<%@page import="dto.CustUserDto"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>custuserdetail</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
	<h1 align="center">Customer Detail</h1>
<%
	CustUserDto dto = (CustUserDto)request.getAttribute("dto");

%>


<div align="center">

<form action="custuserupdate">
<input type="hidden" name="command" value="view"> 
<table>
	<col width="100">
	<col width="300">
	<tr>
		<td colspan="2" height="1" bgcolor="#00000"></td>
	</tr>
	<tr>
		<th>ID</th>
		<td>
			<input type="text" size="30" value="<%=dto.getId() %>" disabled="disabled"> 
			<input type="hidden" name="id" value="<%=dto.getId() %>"> 
		</td>
	</tr>
	<tr>
		<th>NAME</th>
		<td>
			<input type="text" size="30" value="<%=dto.getName() %>" disabled="disabled"> 
		</td>
	</tr>
	<tr>
		<th>ADDRESS</th>
		<td>
			<input type="text" name="address" size="30" value="<%=dto.getAddress()%>" disabled="disabled"> 
		</td>
	</tr>
	<tr>
		<td colspan="2" height="1" bgcolor="#00000"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정"> 
			<button type="button" onclick="del()">삭제</button> 
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="back()" style="width:100px ">뒤로가기</button>
		</td>
	</tr>

</table>
</form>

</div>



<script type="text/javascript">
function back() {
	location.href="custuserlist";
}
function del() {
	// 삭제하는 메소드
	var a = document.getElementsByName("id")[0].value;
	location.href="custuserdel?command=one&id="+a;
}


</script>
</body>
</html>