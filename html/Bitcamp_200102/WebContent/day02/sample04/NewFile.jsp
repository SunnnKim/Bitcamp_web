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
// 여기는 Java 코드 영역
// = scriptlet ( script + applet )
String id = request.getParameter("id");
System.out.println("id: " + id);
String password = request.getParameter("pwd");
System.out.println("password: " + password);



// request : 요청 
// (참고) response : 응답
// jsp 는 자바 코드를 사용하기 때문에 디비와 연결이 가능하다!

%>




</body>
</html>