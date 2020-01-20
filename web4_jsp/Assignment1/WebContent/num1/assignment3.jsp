<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	String str="";
	 if( hour <= 12){
		// 오전
		str="안녕히 주무셨어요";
	}else if(hour > 12 && hour < 18 ){
		hour -= 12;
		str="안녕하세요";
	}else{
		hour -= 12;
		str="안녕히 주무세요";
		
	} 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>현재는 <%=hour %>시 입니다.</p>
<p><%=str %></p>


</body>
</html>