<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
// java code
String number = request.getParameter("num");
String date = request.getParameter("date");
String color = request.getParameter("color");
String range = request.getParameter("range");
String search = request.getParameter("search");

System.out.printf("num: %s\ndate: %s\ncolor: %s\nrange: %s\nsearch: %s\n",number, date,color, range, search );
%>


</body>
</html>