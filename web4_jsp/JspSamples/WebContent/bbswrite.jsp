<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.content{
	overflow-y: scroll;
	
}
</style>
</head>
<body>
<%--

	ID = text, disable로 설정	-->session이 가지고 잇음
	TITLE = text
	CONTENT = textarea
	
	button : form => bbswriteAf.jsp (dao.bbsWrite() 및 후처리)
	
	-- dto --
	ref, step, depth = 0
	wdate = Date()
	del = 0
	readcount = 0
	
	
--%>
<%
	MemberDto dto = (MemberDto)session.getAttribute("loginuser");
%>
<h1 align="center">새글쓰기</h1>
<div align="center">
<form action="bbswriteAf.jsp" method="get">
<table>
<tr>
	<td>ID</td>
	<td>
		<input type="text" size="30" disabled="disabled" value="<%=dto.getId()%>">
		<input type="hidden" name="id"  value="<%=dto.getId()%>">
	</td>
</tr>
<tr>
	<td>Title</td>
	<td>
		<input type="text"  size="30"  name="title">
	</td>
</tr>
<tr>
	<td colspan="2">
		<textarea rows="10" cols="40" name="content" class='content'></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" value="뒤로가기" onclick="location.href='bbslist.jsp'">
		<input type="submit" value="글쓰기">
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>