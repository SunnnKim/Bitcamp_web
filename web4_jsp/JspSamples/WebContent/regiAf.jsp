<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	
%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
//	System.out.println(id);
//	System.out.println(pwd);

	MemberDto dto = new MemberDto(id, pwd, name, email,3);
	
	// 집어넣기 
	boolean b = MemberDao.getInstance().addMem(dto);
	

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(b){
	%>
		<script type="text/javascript">
			alert('성공적으로 추가했습니다.');
			location.href="login.jsp";
		</script>
	
	<%
}
else{
	%>
	<script type="text/javascript">
		alert('추가 실패!');
		location.href="regi.jsp";
	</script>

<%
}
%>

</body>
</html>