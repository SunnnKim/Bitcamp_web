<%@page import="sample01.MyUtil"%>
<%@page import="sample01.YouClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
// 클래스 정의하기 
public class MyClass{
	private int num;
	private String name;
	
	public MyClass(){
		num =12;
		name = "world";
	}
	public String print(){
		return num + " " + name; 
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// 인스턴스 생성하기 
	MyClass cls  = new MyClass();
%>
<%-- 함수 실행하기  --%>
<%=cls.print() %>
<br><br>

<%-- 클래스 불러서(import) 사용하기  --%>
<%
	YouClass ycls= new YouClass(100,"일지매");
	
%>
<%= ycls.toString() %>

<%-- static 함수 호출하기 --%>
<%
	MyUtil.myFunc();
	// static 함수가 호출됨 
%>


<%
String str = "hello";

%>
<br><br>

<%-- 태그의 값에 자바 변수 넣기 --%>
<input type="text" size="20" value= "<%=str %>" >

</body>
</html>