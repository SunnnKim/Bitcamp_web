<%@page import="dao.CustUserDao"%>
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
	CustUserDao dao = CustUserDao.getInstance();
	boolean b = dao.deleteOne(id);
	if(b){
		%>
		<script type="text/javascript">
			alert("성공적으로 삭제했습니다!");
			location.href="custuserlist.jsp"
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("삭제실패");
			location.href="custuserlist.jsp"
		</script>
		<%
		
	}
%>
</body>
</html>