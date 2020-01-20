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
	int count=1;
	if(session.getAttributeNames() == null ){
		session.setAttribute("visited", "1");
		// 아래 코드와 동일한 결과
		// request.getSession().getAttribute("visited");
		
	}else{
		if(session.getAttribute("visited") == null ){
			session.setAttribute("visited", "1");			
		}
		else{
			String num = (String)session.getAttribute("visited");
			count = Integer.parseInt(num);
			count++;
			session.setAttribute("visited", count+"");
		}
	
	}
	if(count == 10 ){
		session.removeAttribute("visited");
	}


%>
<h1>JSP 실습</h1>
<p>Visited Count : <%= count%></p>
</body>
</html>