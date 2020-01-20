<%@page import="sample3.DtoClass"%>
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

String addr = "경기도";
int age = 24;
%>
<%
//내장객체

// 1. 따로 따로 보내기
// request.setAttribute("addr", addr);
// request.setAttribute("age", age);

// 2. dto 클래스로 묶어 하나로 보내기
 request.setAttribute("dto", new DtoClass(addr, age));

// 3. session으로 넣어서 보내기
// session.setAttribute("dto", new DtoClass(addr, age));

// 4. application 내장객체
// application.setAttribute("dto", new DtoClass(addr, age));

//request가 제일 가벼움 (단발성)

pageContext.forward("NewFile3.jsp"); 
// 위의 방법은 
// request.setAttribute()이나 session.setAttribute() 로 했을 때 보낼수 있음

// respond.sendRedirect() 는
// respond.sendRedirect("NewFile.jsp?name=name&age=17") 이런식으로 작성해서 보내거나
// session에 담아서 보내야 한다

%>


</body>
</html>