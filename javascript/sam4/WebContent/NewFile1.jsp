<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

	String name = request.getParameter("name");
	String sage = request.getParameter("age");
	String address = request.getParameter("address");
	
	int age = Integer.parseInt(sage);
	out.println("name: " + name + "<br>");
	out.println("sage: " + age+ "<br>");
	out.println("addresss: " + address+ "<br>");
	
%>

</body>
</html>