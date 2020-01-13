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

    String name = request.getParameter("name");
    String post = request.getParameter("post");
    String address = request.getParameter("address");
    String call1 = request.getParameter("call1");
    String call2 = request.getParameter("call2");
    String call3 = request.getParameter("call3");
    String sel = request.getParameter("sel");
    
    String recipt = "";
    if(request.getParameter("recipt")!=null){
    	recipt= request.getParameter("recipt");
    }
    
    String magazine = request.getParameter("magazine");
    

    out.println("이름: " + name +"<br>");
    out.println("우편번호: " + post+"<br>");
    out.println("주소: " + address+"<br>");
    out.println("전화번호: " + call1 + "-" + call2+ "-" + call3+"<br>");
    out.println("배달시간: " + sel+"<br>");
    out.println("영수증: " + recipt+"<br>");
    out.println("매거진 수신: " + magazine+"<br>");


%>

</body>
</html>