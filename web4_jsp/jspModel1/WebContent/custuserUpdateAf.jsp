<%@page import="dao.CustUserDao"%>
<%@page import="dto.CustUserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	String id = request.getParameter("id");
	String address = request.getParameter("address");
	
	CustUserDao dao = CustUserDao.getInstance();
	boolean b = dao.updateCustUser(id, address);
	
	if(b){
		%>
	<script type="text/javascript">
		alert("수정완료");
		location.href="custuserlist.jsp";
	</script>		
		
		<% 
	}
	else{
		%>
		
	<script type="text/javascript">
			alert("수정실패");
			location.href="custuserUpdate.jsp";
	</script>		
		
		<% 
		
		
	}
%>




</body>
</html>