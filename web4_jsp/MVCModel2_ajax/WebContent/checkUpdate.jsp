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
	String id = request.getParameter("id");

	if(isSuccess.equals("true")){
		%>
		<script type="text/javascript">
			alert('Successfully Update Customer!');
			location.href="custuserlist.html";
		</script>		
		<% 
	}
	else{
		%>
	<script type="text/javascript">
		alert(' Fail to update Customer');
		location.href="custuserdetail.jsp?id="+id;
	</script>		
		<% 
	}
%>

</body>
</html>