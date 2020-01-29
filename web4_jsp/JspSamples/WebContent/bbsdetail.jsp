<%@page import="dto.MemberDto"%>
<%@page import="dto.BBSDto"%>
<%@page import="dao.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	int seq = Integer.parseInt( request.getParameter("seq"));
 	BBSDao dao = BBSDao.getInstance();
 	// readCount - 올리기
	dao.readCount(seq); 
	
 	BBSDto dto = dao.showBbs(seq);
 	
 	// 내가 쓴 글인지 보기
 	MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
 	String loginid = (String)loginuser.getId();
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
textarea{
	overflow-y: scroll;
}
</style>
</head>
<body>
<%--

작성자 
제목
작성일	
조회수	-> readcount()함수 따로 호출하기
내용

버튼 (삭제/수정), 댓글, 목록



 --%>
 <div align ="center">
 <h1>글 보기 </h1>
<table border="1">
	<tr>
		<td>제목 : </td>
		<td>
			<input type="text" value="<%=dto.getTitle()%>" size="30" disabled="disabled">
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
			<textarea rows="10" cols="40" disabled="disabled"><%=dto.getContent() %></textarea>
		</td>
	</tr>
	<%
	if(dto.getId().equals(loginid)){
	%> 
		<tr>	
			<td colspan="2" style="text-align: center">
				<input type="button" onclick="location.href='updatebbs.jsp?seq=<%=dto.getSeq() %>'" value="수정">
				<input type="button" onclick="delBtn()" value="삭제">
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
	
	<tr>
		<td colspan="2" style=" border:0; border-top: 3px solid; margin: 0; " ></td>
	</tr>
	<tr>	
		<td colspan="2">댓글보기</td>
	</tr>
	<tr>
		<td colspan="2"></td>
	</tr>
</table>
</div>
<script type="text/javascript">
function delBtn() {
	if(confirm('삭제하시겠습니까?')){
	location.href= "deletebbs.jsp?seq=<%=dto.getSeq() %>";
	}
	
}

</script>

</body>
</html>