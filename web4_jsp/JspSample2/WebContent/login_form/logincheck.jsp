<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//logincheck
String b = request.getParameter("b");
String id = request.getParameter("id");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

if(b.equals("true")){
	
	%>
		<script type="text/javascript">
			alert("<%=id%>님, 로그인 성공");
			location.href="../bbslist";
		</script>
	<%
}else{
	%>
		<script type="text/javascript">
			alert("아이디/비밀번호 오류");
			location.href="index.html";
		</script>
	<%
	
}
%>

</body>
</html>