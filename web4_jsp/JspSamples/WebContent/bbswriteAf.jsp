<%@page import="dto.BBSDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BBSDto dto = new BBSDto(id, title, content);
	dto.setRef(0)
	
	/*
		-- dto --
	ref, step, depth = 0
	wdate = Date()
	del = 0
	readcount = 0
	
	
	*/

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>