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
	String isSuccess = request.getParameter("isSuccess");

	if(isSuccess.equals("true")){
		%>
		<script type="text/javascript">
			alert('Successfully Add Customer!');
			location.href="custuserlist.html";
		</script>		
		<% 
	}
	else{
		%>
	<script type="text/javascript">
		alert(' Fail to add Customer');
		location.href="custuseradd.html";
	</script>		
		<% 
	}
%>

</body>
</html>