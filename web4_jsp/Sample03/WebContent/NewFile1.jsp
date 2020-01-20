<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	// javaScript에서 보낸 데이터 받기
	String name = request.getParameter("name");
	String email = request.getParameter("email");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>NewFile1.jsp</h1>
<p>name : <%=name %></p>
<p>email : <%=email %></p>




</body>
</html>