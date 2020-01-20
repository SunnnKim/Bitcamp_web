<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = "Hello World!";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
out.println("<h1>"+str+"</h1>");
out.println("<p>"+str+"</p>");
%>
</body>
</html>