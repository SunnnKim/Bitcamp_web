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
	String b = request.getParameter("b");
	if(b.equals("true")){
		%>
		<script>
			alert("All Successfully deleted!")
			location.href="custuserlist.html";
		</script>
		<%
	}
	else{
		%>
		<script>
			alert("Fail to delete all");
			location.href="custuserlist.html";
		</script>
		<%
	}
%>

</body>
</html>