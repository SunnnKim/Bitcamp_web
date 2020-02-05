<%@page import="dto.PdsDto"%>
<%@page import="dao.PdsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MemberDto user = (MemberDto)session.getAttribute("login");

String sseq = request.getParameter("pdsseq");
int seq = Integer.parseInt(sseq);

PdsDao dao = PdsDao.getInstance();
PdsDto dto = dao.getPds(seq);

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdsupdate.jsp</title>
</head>
<body>

<h1>자료 수정</h1>

<div align="center">

<form action="pdsupdateAf.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">

<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td><%=user.getId() %>
		<input type="hidden" name="id" value="<%=user.getId() %>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50" value="<%=dto.getTitle() %>">
	</td>
</tr>

<tr>
	<th>업로드파일</th>
	<td>
		<input type="text" name="oldfile" size="50" value="<%=dto.getFilename() %>">
	</td>
</tr>

<tr>
	<th>변경 파일업로드</th>
	<td>
		<input type="file" name="fileload" style="width:400px">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"><%=dto.getContent() %></textarea>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="수정">
	</td>
</tr>

</table>

</form>

</div>

</body>
</html>