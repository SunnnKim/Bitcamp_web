<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BBSDao"%>
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
	int seq = Integer.parseInt( request.getParameter("seq"));
 	BBSDao dao = BBSDao.getInstance();
	
 	BbsDto dto = dao.showBbs(seq);
 	
 	// 내가 쓴 글인지 보기
 	MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
 	String loginid = (String)loginuser.getId();
%>
<div align ="center">
 <h1>글 보기 </h1>
<form action="updatebbsAf.jsp">
<table border="1">
	<tr>
		<td>제목 : </td>
		<td>
			<input type="text" value="<%=dto.getTitle()%>" name="title" size="30">
			<input type="hidden" value="<%=dto.getSeq()%>" name="seq" size="30">
			
		</td>
	</tr>
	<tr>
		<td>작성자 </td>
		<td>
			<input type="text" value="<%=dto.getId()%>" size="30" disabled="disabled"> 
		</td>
	</tr>
	<tr>
		<td>작성일 </td>
		<td><input type="text" value="<%=dto.getWdate() %>" size="30" disabled="disabled"> </td>
	</tr>
	<tr>
		<td>조회 </td>
		<td><input type="text" value="<%=dto.getReadcount() %>" size="30" disabled="disabled"> </td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="10" cols="40" name="content"><%=dto.getContent() %></textarea>
		</td>
	</tr>
	<%
	if(dto.getId().equals(loginid)){
	%> 
		<tr>	
			<td colspan="2" style="text-align: center">
				<input type="submit" value="수정">
				<input type="button" onclick="location.href='bbslist.jsp'" value="목록보기">
			</td>
		</tr>
	<% }
	else {
		%> 
		<tr>	
			<td colspan="2" style="text-align: center">
				<input type="button" onclick="location.href='bbslist.jsp'" value="목록보기">
			</td>
		</tr>
	<%
		
		
	}
	
	%>
	
	
</table>
</form>
</div>

</body>
</html>