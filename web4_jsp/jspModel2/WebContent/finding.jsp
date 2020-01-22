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
	String isS = request.getParameter("isS");
	if(isS.equals("true")){
		%>
			<script>
				alert("성공했습니다!");
				location.href="custuserlist";
			</script>
		<%
	}else{
		%>
			<script>
				alert("실패했습니다!");
				location.href="custuseradd?command=add";
			</script>
		<%
		
	}

%>

</body>
</html>