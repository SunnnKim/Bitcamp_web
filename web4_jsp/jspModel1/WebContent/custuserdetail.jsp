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
	// data 받아오기
	String id = request.getParameter("id");

	// singleton에서 정보 찾아오기
	CustUserDao dao = CustUserDao.getInstance();
	CustUserDto dto = dao.selectCustUser(id);
	
%>


<div align="center">

<form action="custuserUpdate.jsp">
<table>
	<col width="100">
	<col width="300">
	<tr>
		<td colspan="2" height="1" bgcolor="#00000"></td>
	</tr>
	<tr>
		<th>ID</th>
		<td>
			<input type="text" name="id" id="id"size="30" value="<%=dto.getId() %>" disabled="disabled"> 
		</td>
	</tr>
	<tr>
		<th>NAME</th>
		<td>
			<input type="text" name="name" size="30" value="<%=dto.getName() %>" disabled="disabled"> 
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
			<input type="button" onclick="go()" value="수정"> 
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
	location.href="custuserlist.jsp";
}
function del() {
	// 삭제하는 메소드
	location.href="onedel.jsp?id="+document.getElementById("id").value;
}
function go() {
	// 수정하기
	location.href="custuserUpdate.jsp?id="+ document.getElementById("id").value;
}


</script>
</body>
</html>