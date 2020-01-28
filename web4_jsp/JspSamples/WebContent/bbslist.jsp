<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
	// 또는 request.getSession();
	
	String loginid = loginuser.getId();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 게시판 -->
<h4 align="right" style="background-color: #f0f0f0">환영합니다 <%=loginid %>님,</h4>
<h1>BBS List</h1>
<form>
<table>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
</tr>

</table>
</form>


<a href="bbswrite.jsp">글쓰기</a>




</body>
</html>