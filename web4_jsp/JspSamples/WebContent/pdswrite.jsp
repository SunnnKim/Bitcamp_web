<%@page import="java.util.Date"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto mem = (MemberDto) session.getAttribute("loginuser");

// 시간을 취득
// String fname = (new Date().getTime())+"";	// long형 date() 형으로 파일이름으로 만든다
// System.out.println("fname: " + fname);
// upload => myData.txt -> 1580695728906.txt(현재시간으로파일명만들기-충돌방지위해)
// download => 1580695728906.txt -> myData.txt (원본 파일이름으로 만들어줌: 단, 오리지널 파일네임을 dto에 저장해두어야 함)
// 파일명은 영어가 좋음


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>자료올리기</h1>

<div align="center">

<%--

id, title, content --- > String  ( = form field data )
		file	   --- > byte


form 으로 파일과 폼필드를 같이 날려줄 때 전송방식은 반드시 post, 
encodetype 은 반드시 multipart/form-data (cos.jar 파일이 해줌)
 --%>
<form action="pdsupload.jsp" method="post" enctype="multipart/form-data">
<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td><%=mem.getId() %>
		<input type="hidden" name="id" value="<%=mem.getId()%>"> 
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50">
	</td>
</tr>
<tr>
	<th>파일업로드</th>
	<td>
		<input type="file" name="fileload" style="width: 400px"><!-- String(getParameter)으로 받을 수 없고 byte로 받아야함  -->
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