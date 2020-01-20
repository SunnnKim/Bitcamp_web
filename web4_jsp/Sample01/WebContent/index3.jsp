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
// 내장객체 : 동적 할당하지 않고 바로 사용할수 있는 Object
// request : 가장 많이 사용, getParameter, setAttribute, getAttribute 등 접근 가능
// response : sendRedirect, 
// out
// session


// 1. response
// getParameter : 무조건 String값만 받음

String name = request.getParameter("name"); 	
System.out.println("name = " + name );

String age = request.getParameter("age");
System.out.println("age = " + age );

// 넘어올 때의 방식 : <input type="text">	: html
//			    <a href=''> : html
//				<form action=''> : html
//				location.href	: javascript
//				submit() : jquery

// 데이터가 여러개 넘어올 때
String hobby[] = request.getParameterValues("hobby");
if( hobby != null && hobby.length > 0) {
	for(int i=0; i<hobby.length; i++){
		System.out.println("hobby = " + hobby[i]);
	}
}
		

%>

</body>
</html>