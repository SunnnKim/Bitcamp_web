<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
int globalValue=0;

%>
<%
globalValue++;
int localValue=0;
localValue++;
%>
<h1>Global Value & Local Value</h1>
<p>global : <%=globalValue %></p>
<p>local : <%=localValue %></p>
</body>
</html>