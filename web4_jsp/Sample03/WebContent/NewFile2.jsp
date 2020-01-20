<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>NewFile2.jsp</h1>
<p>age: <%=age %></p>
<p>addr: <%=addr %></p>

</body>
</html>