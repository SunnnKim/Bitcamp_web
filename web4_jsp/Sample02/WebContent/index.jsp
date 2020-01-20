<%@page import="sam.Human"%>
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


response(응답) : sendRedirect -> HttpServletResponse 소속
<%--

/* 
	// sendRedirect : 특정 파일 / url 등으로 이동
	// 데이터 가지고 이동할 수 있다.
	// response.sendRedirect("NewFile.jsp");
	
	
	// 한글일때는 인코딩 방식 설정하기
	request.setCharacterEncoding("utf-8");
	// URLEncoder 까지 해주어야 정상적으로 한글 인코딩이 적용됨
	String name = "홍길동";
	name = URLEncoder.encode(name);
	
	
	response.sendRedirect("NewFile.jsp?name="+name);
 */

/*
// forward 방식
String name = "일지매";
request.setAttribute("name", name);

// pageContext (내장객체) : forward사용할 때의 내장객체 
// 자바에서는 Dispatcher로 접근했었음
// pageContext.forward("NewFile.jsp"); // 잘가 짐...

*/

--%>
<%--
/*

// forward 방식
// 짐싸서 NewFile1.jsp으로 이동
int num = 1;
String name = "성춘향";

Human human = new Human(num, name);

request.setAttribute("human", human);
pageContext.forward("NewFile1.jsp");
*/
--%>




<%

// session으로 짐 싸고 sendRequest로 데이터 보내기 
int num = 2;
String name = "정수동";

Human human = new Human(num, name);
 
// request.setAttribute("hman", human);
// response.sendRedirect("NewFile2.jsp");
// 위의 코드는 데이터 여러개 만들려면 링크주소에 데이터를 다 붙여줘야함


// session을 사용하면 객체 데이터 가지고 이동할 수 있음
session.setAttribute("hman", human);
response.sendRedirect("NewFile2.jsp");


%>
   
</body>
</html>