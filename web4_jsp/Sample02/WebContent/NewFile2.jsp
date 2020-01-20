<%@page import="sam.Human"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>NewFile2.jsp</h1>

<%
	Human human = (Human)session.getAttribute("hman");
	
	//session 삭제하기
	session.removeAttribute("hman");

%>

<p>name : <%=human.getName() %></p>
age: <input type="text" value="<%=human.getNum() %>">


</body>
</html>