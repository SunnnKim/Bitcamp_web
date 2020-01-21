<%@page import="dto.CustUserDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>custuserlist</title>
</head>
<body>
<%
//	MVC Model1은  view에다가 controller 만든다 but 쓸일 별로 없음

// singleton과 dto List 불러오기 
CustUserDao dao =  CustUserDao.getInstance();
List<CustUserDto> list = dao.getCustUserList();

%>
<%-- html view 부분 --%>
<h1 align="center">Customer List</h1>
<div align="center">
<form action="muldel.jsp" method="get">
<table style="width: 700">
<col width="100">
<col width="300">
<col width="300">
	<tr>
		<td height="2" bgcolor="#000000" colspan="3"></td>
	</tr>
	<tr>
		<th bgcolor="#ffff00">
			<input type="checkbox" name="alldel" onclick="deleteChecks(this.checked)">
		</th>
		<th>ID</th>
		<th>NAME</th>
	</tr>
	<tr>
		<td height="2" bgcolor="#000000" colspan="3"></td>
	</tr>
<%
if(list.size() == 0) {
	// list에 데이터가 하나도 없을 때
	%>
		<tr bgcolor="#f6f6f6">
			<td colspan="3" align="center" height="100">고객 리스트가 존재하지 않습니다.</td>
		</tr>	
		<tr>
			<td height="2" bgcolor="#000000" colspan="3"></td>
		</tr>
	<%
}
else{
	// list에 데이터가 있을 때 (size가 0이 아닐 때)
	for( int i =0; i<list.size(); i++){
		CustUserDto cust = list.get(i);
	%>	
		<tr bgcolor="#f6f6f6"  align="center">
			<td bgcolor="yellow">
				<input type="checkbox" name="delck" value="<%= cust.getId()%>">
			</td>
			<td>
				<%= cust.getId() %>
			</td>
			<td>
				<a href="custuserdetail.jsp?id=<%=cust.getId()%>"><%=cust.getName() %></a>
			</td>
		</tr>
		<tr>
			<td height="2" bgcolor="#000000" colspan="3"></td>
		</tr>
	<% 
	}
	
}
%>
<tr>
	<!-- 다중삭제 버튼 -->
	<td align="center" height="1" bgcolor="#c0c0c0" colspan="3">
		<input type="submit" value="고객정보 삭제">
	</td>
</tr>
<tr>
	<td height="2" bgcolor="#000000" colspan="3"></td>
</tr>
	<!-- 회원추가 버튼 -->
<tr bgcolor="#f6f6f6">
	<td colspan="3">
		<a href="custadd.jsp">고객정보추가</a>
	</td>
</tr>
</table>


</form>
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
// 메인 체크박스 클릭시 모두 클릭되도록 하기

function deleteChecks( ch ) {
	
	var arrCheck = document.getElementsByName("delck");
	for (var i = 0; i < arrCheck.length; i++) {
		arrCheck[i].checked = ch;
	}		
}
</script>




</body>
</html>