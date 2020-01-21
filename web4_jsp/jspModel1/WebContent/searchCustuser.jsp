<%@page import="dao.CustUserDao"%>
<%@page import="dto.CustUserDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 align="center">Searching Page</h1>

<%
	// 싱글턴
	CustUserDao dao = CustUserDao.getInstance();
	// 검색 데이터 담을 리스트
	List<CustUserDto> sList;
	String data = request.getParameter("search");
	int choice = 0;
	
	String option = request.getParameter("option");
	if( option.equalsIgnoreCase("id")) choice = 1;
	else if( option.equalsIgnoreCase("name") ) choice = 2;
	else choice = 3;
			
	sList = dao.searchCustuser(choice, data);
	System.out.println(sList.size());
%>

<div align="center">
<table style="width: 700">
<col width="200">
<col width="300">
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
<%
if(sList.size() == 0) {
	// list에 데이터가 하나도 없을 때
	%>
		<tr bgcolor="#f6f6f6">
			<td colspan="2" align="center" height="100">검색 리스트가 존재하지 않습니다.</td>
		</tr>	
		<tr>
			<td height="2" bgcolor="#000000" colspan="2"></td>
		</tr>
	<%
}
else{
	// list에 데이터가 있을 때 (size가 0이 아닐 때)
	for( int i =0; i<sList.size(); i++){
		CustUserDto cust = sList.get(i);
	%>	
		<tr bgcolor="#f6f6f6"  align="center">
			
			<td bgcolor="grey" style="color: white; padding:0px;" >
				<%= cust.getId() %>
			</td>
			<td>
				<a href="custuserdetail.jsp?id=<%=cust.getId()%>"><%=cust.getName() %></a>
			</td>
		</tr>
		<tr>
			<td height="2" bgcolor="#000000" colspan="2"></td>
		</tr>
	<% 
	}
	
}
%>
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
	location.href="custuserlist.jsp";
}

</script>
</body>
</html>