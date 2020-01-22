<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
// DB
// json 파일 만들기
String username = "홍길동";
int usernumber = 1001;

// { "num": 1001, "name":"홍길동" }
String json = "{ \"num\":" + usernumber + ", \"name\":\"" + username+"\" }";

// model 1일 때
out.println(json);


	

%>