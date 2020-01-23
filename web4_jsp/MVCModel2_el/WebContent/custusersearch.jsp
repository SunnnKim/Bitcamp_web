<%@page import="dao.CustUserDao"%>
<%@page import="dto.CustUserDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 align="center">Searching Page</h1>


<div align="center">
<table style="width: 700">
<col width="300">
<col width="400">
	<tr>
		<td height="2" bgcolor="#000000" colspan="2"></td>
	</tr>
	<tr>
		<th bgcolor="grey" style="color: white;" >ID</th>
		<th>NAME</th>
	</tr>
	<tr>
		<td height="2" bgcolor="#000000" colspan="2"></td>
	</tr>
<c:if test="${fn:length(list) == 0 }">
	// list에 데이터가 하나도 없을 때
		<tr bgcolor="#f6f6f6">
			<td colspan="2" align="center" height="100">검색 리스트가 존재하지 않습니다.</td>
		</tr>	
		<tr>
			<td height="2" bgcolor="#000000" colspan="2"></td>
		</tr>
</c:if>
<c:if test="${fn:length(list) > 0 }">

<c:forEach items="${list }" varStatus="i" var="list">
	
		<tr bgcolor="#f6f6f6"  align="center">
			
			<td bgcolor="grey" style="color: white; padding:0px;" >
				<c:out value=" ${list.id }"/>
			</td>
			<td>
				<a href="custuserdetail.jsp?id= ${list.name }"> ${list.name}</a>
			</td>
		</tr>
		<tr>
			<td height="2" bgcolor="#000000" colspan="2"></td>
		</tr>
	
</c:forEach>
</c:if>
<tr>
	<td align="center" height="1" colspan="2" style="padding:30px;">
		<input type="button" onclick="back()" value="뒤로가기">
	</td>
</tr>

</table>
</div>

<!-- 검색기능 -->
<div align="center">
<form action="searchCustuser.jsp">
<select name="option">
	<option>Id</option>
	<option>Name</option>
	<option>Address</option>
</select>
<input type="text" size="30px" name="search">
<input type="submit" value="검색">
</form>

</div>
<script type="text/javascript">
function back() {
	location.href="custuserlist";
}

</script>
</body>
</html>