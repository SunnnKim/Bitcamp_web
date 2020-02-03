<%@page import="dto.PdsDto"%>
<%@page import="dao.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

PdsDao dao = PdsDao.getInstance();
PdsDto dto = dao.getPdsDetail(seq);

// 원래파일 업로드 경로
String fupload = application.getRealPath("/upload");
fupload+= "\\"+ dto.getFilename();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">Update</h1>

<div align="center">
<form action="pdsupdateAf.jsp" method="post" enctype="multipart/form-data">
<table>
<col width="100">
<col width="200">
<tr>	
	<th>Title</th>
	<td>
		<input type="text" value="<%=dto.getTitle() %>" name="title" >
		<input type="hidden" value="<%=dto.getSeq() %>" name="seq" >
	</td>
</tr>
<tr>	
	<th>ID</th>
	<td><input type="text" value="<%=dto.getId() %>" name="id" readonly="readonly">
	</td>
</tr>
<tr>	
	<td colspan="2" style="padding-top: 20px">
		<textarea rows="10" cols="40" name="content"><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" style="text-align: center" height="40">
		<input type="file" name="newfile" value="" onclick="console.log(this.value)">
		<input type="hidden" name="oldfile" value="fupload">
	</td>
</tr>	
</table>

<div style="margin-top: 20px">
	<input type="submit" value="수정하기">
	<input type="button" onclick="location.href='pdslist.jsp'" value="뒤로가기">	
	
</div>
</form>

</div>

</body>
</html>