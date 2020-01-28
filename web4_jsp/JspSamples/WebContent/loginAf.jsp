<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	MemberDto loginuser = MemberDao.getInstance().login(id, pwd);
		
	
%>
<%
	if(loginuser != null){
		// 세션에 로그인 정보 저장
		session.setAttribute("loginuser", loginuser);
		session.setMaxInactiveInterval(30*60*60);
	%>
		<script>
			location.href="bbslist.jsp";
		</script>
	<%
	}
	else{
	%>
		<script>
			alert('아이디 또는 비밀번호 오류');
			window.close();
		</script>
	<%
		
	}

%>
</body>
</html>