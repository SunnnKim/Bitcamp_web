<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
download complete
<%
String filename = (String)request.getAttribute("filename");
System.out.println(filename);
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<div id="kieok-jeopyun-e">
 	<p>이미지 보기</p>
    <img src="${pageContext.request.contextPath}/filedownload?filename=<%=filename%>">
 </div> 
</p>
</body>
</html>