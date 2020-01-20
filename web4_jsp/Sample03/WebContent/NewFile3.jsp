<%@page import="sample3.DtoClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	DtoClass dto = (DtoClass) request.getAttribute("dto");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>NewFile3.jsp</h1>
<p>age : <%=dto.getAge() %></p>
<p>addr : <%=dto.getAddr() %></p>



</body>
</html>