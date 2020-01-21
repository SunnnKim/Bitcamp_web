<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% request.setCharacterEncoding("utf-8"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>custadd</title>
<style type="text/css">
td{
	padding: 10px;
}
th, td{
	text-align: center;
}
</style>
</head>
<body>

<h1 align="center">Add Customer</h1>
<div align="center">
<form action="custaddAf.jsp" method="get" id="frm">
<table>
	<col width="100">
	<col width="300">
	<tr>
		<td colspan="2" height="1" bgcolor="#00000"></td>
	</tr>
	<tr>
		<th>ID</th>
		<td>
			<input type="text" size="30" name="id"> 
		</td>
	</tr>
	<tr>
		<th>NAME</th>
		<td>
			<input type="text" size="30" name="name"> 
		</td>
	</tr>
	<tr>
		<th>ADDRESS</th>
		<td>
			<input type="text" size="30" name = "address"> 
		</td>
	</tr>
	<tr>
		<td colspan="2" height="1" bgcolor="#00000"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="추가">
			<input type="reset" value="취소">
		</td>
	</tr>

</table>
</form>
</div>


</body>
</html>