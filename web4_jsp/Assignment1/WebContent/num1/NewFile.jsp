<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>-- 사용자의 입력을 출력한다 --</p>
<ul style="list-style: circle">
	<li>이름 :  <%=name %></li>
	<li>생년월일 :  <%=birth %></li>

</ul>

</body>
</html>