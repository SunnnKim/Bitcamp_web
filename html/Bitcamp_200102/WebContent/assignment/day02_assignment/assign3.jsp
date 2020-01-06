<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = request.getParameter("name");
	String eng = request.getParameter("eng");
	String[] seclang = request.getParameterValues("seclang");
	String opinion = request.getParameter("opinion");	
	String age = request.getParameter("age");
	
	System.out.println("이름: " + name);
	System.out.println("영어로 대화 가능?: " + eng);
	System.out.print("영어 외 가능한 언어: ");
	if(  seclang!= null){
		for(String s : seclang){
			System.out.print(s+" ");
		}
	}
	System.out.println();

	System.out.println("영어수업에 대한 의견 : "+opinion);
	System.out.println("나이: "+age);

%>    
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>