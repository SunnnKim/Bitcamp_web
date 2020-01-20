<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>

<%!
public String setColorHTML(String str, String color){
	return "<font color=\""+color+"\">"+str+"</font>";
}
%>

<%
String redText = setColorHTML("빨강색 텍스트", "#ff0000");
String greenText = setColorHTML("녹색 텍스트", "#00ff00");
String blueText = setColorHTML("파랑 텍스트", "#0000ff");

%>
<p>-- 메소드를 사용하는 예 --</p>
<p><%=redText %></p>
<p><%=greenText %></p>
<p><%=blueText %></p>

<%



%>


</body>
</html>