<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>NewFile.jsp</h1>
<%
// 1번 : sendRedirect
//한글일때는 인코딩 방식 설정하기
// String name = request.getParameter("name");


// 2번 : forward (객체로 보낼 수 있음)
String name = (String)request.getAttribute("name");



%>

<!-- 태그의 값에 이전 jsp 에서 받아온 데이터 뿌리기 -->
<input type="text" value="<%=name %>">

</body>
</html>