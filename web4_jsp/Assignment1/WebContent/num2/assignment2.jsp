<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JSP로 구구단 작성하기</h1>
<%!
	int g_val = 0;
%>



<table border="1">
<% for(int i=0; i<=g_val; i++){ %>
<tr>
	<% for (int j=0;j <= g_val; j++) { %>
		<td><%=i %> * <%=j %> = <%=i*j %> </td>
	<% } %>
</tr>
<% } 
	g_val++;
	if(g_val>10){
		g_val=0;
	}
%>
</table>


</body>
</html>