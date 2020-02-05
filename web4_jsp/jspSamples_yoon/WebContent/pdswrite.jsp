<%@page import="java.util.Date"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");

// 시간을 취득
String fname = (new Date().getTime()) + "";
System.out.println("fname:" + fname);

// old			 new 	
// mydata.txt -> 1580695728906.txt -> upload
// 1580695728906.txt -> download -> mydata.txt
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdswrite.jsp</title>
</head>
<body>

<h1>자료 올리기</h1>

<div align="center">

<%--
	id, title, content -> String -> from field data
	file			   -> byte
 --%>
 													<!-- cos.jar -->
<form action="pdsupload.jsp" method="post" enctype="multipart/form-data"> 

<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td><%=mem.getId() %>
		<input type="hidden" name="id" value="<%=mem.getId() %>">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50">
	</td>
</tr>

<tr>
	<th>파일 업로드</th>
	<td>
		<input type="file" name="fileload" style="width:400px">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"></textarea>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="올리기">
	</td>
</tr>



</table>

</form> 



</div>





</body>
</html>






