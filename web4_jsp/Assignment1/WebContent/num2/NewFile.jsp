<%@page import="assignment.InfoClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>전송된 정보</h1>
<h4>getParameter</h4>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("id");
	String hobby[] = request.getParameterValues("hobby");
	String age = request.getParameter("age");
	String detail = request.getParameter("detail");

	// dto class만들어서 보내기
//	InfoClass dto = (InfoClass)request.getAttribute("dto");

%>

<p>id : <%=id %></p>
<p>pw : <%=pw %></p>
<p>age : <%=age %></p>
<%for(int i=0; i<hobby.length; i++){ %>
	<p>hobby : <%= hobby[i] %>
	 </p>
<% } %>

<p>detail : <%=detail %></p>

</body>
</html>