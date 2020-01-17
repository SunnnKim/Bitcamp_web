<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // scriptlet : 자바영역
    Member mem = (Member)request.getAttribute("member");

	System.out.println(mem.toString());
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h3>Detail.jsp</h3>
	<p>이름: <%=mem.getName() %></p>
	나이: <input type="text" value="<%=mem.getAge() %>">


</body>
</html>