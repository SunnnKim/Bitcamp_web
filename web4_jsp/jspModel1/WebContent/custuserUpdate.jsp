<%@page import="dto.CustUserDto"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		// data 받아오기
   		String id = request.getParameter("id");
   		CustUserDao dao = CustUserDao.getInstance();
   		CustUserDto dto = dao.selectCustUser(id);
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
			<input type="text" name="id" id="id" size="30" value="<%=dto.getId()%>" disabled="disabled"> 
		</td>
	</tr>
	<tr>
		<th>NAME</th>
		<td>
			<input type="text" name="name" size="30" value="<%=dto.getName() %>"  disabled="disabled"> 
		</td>
	</tr>
	<tr>
		<th>ADDRESS</th>
		<td>
			<input type="text" name="address" id="add" size="30" value="<%=dto.getAddress()%>"> 
		</td>
	</tr>
	<tr>
		<td colspan="2" height="1" bgcolor="#00000"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" onclick="btn()" value="수정하기"> 
			<button type="button" onclick="back()" style="width:80px">뒤로가기</button>
		</td>
	</tr>

</table>
</form>

</div>


<script type="text/javascript">
function back() {
	location.href="custuserlist.jsp";
}
function btn() {
	var id = document.getElementById("id").value;
	var address = document.getElementById("add").value;
	location.href="custuserUpdateAf.jsp?id="+ id +"&address="+address;
}

</script>

</body>
</html>