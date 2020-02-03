<%@page import="dto.MemberDto"%>
<%@page import="dto.PdsDto"%>
<%@page import="dao.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);
System.out.println(seq);

PdsDao dao = PdsDao.getInstance();
dao.readCount(seq);
PdsDto dto = dao.getPdsDetail(seq);

%>
<%
//session 정보
MemberDto loginuser = (MemberDto) session.getAttribute("loginuser");


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td{ padding-left: 10px; }
</style>
</head>
<body>

<h1 align="center">Detail</h1>

<div align="center">
<table border="1">
<col width="100">
<col width="200">
<tr>	
	<th>Title</th>
	<td style="font-size: 20px"><%=dto.getTitle() %></td>
</tr>
<tr>	
	<th>ID</th>
	<td><%=dto.getId() %>
	</td>
</tr>
<tr>	
	<th>조회수</th>
	<td><%=dto.getReadcount() %>
	</td>
</tr>
<tr>	
	<th>다운로드수</th>
	<td><%=dto.getDowncount() %></td>
</tr>
<tr>	
	<td colspan="2" style="height: 250px">
		<%=dto.getContent() %>
	</td>
</tr>
<%
if(dto.getFilename().equals("") || dto.getFilename()== null ){
	%>
	<tr>
		<td colspan="2">
		파일 없음
		</td>
	</tr>
	<%
}else{
	%>
	<tr>
		<td colspan="2" style="text-align: center" height="40">
			<%=dto.getFilename() %>
			<input type="button" name="btndown" value="다운로드" onclick="location.href='filedown?filename=<%=dto.getFilename()%>&seq=<%=dto.getSeq()%>'">
		</td>
	</tr>	
	<%
}
%>
</table>


<div style="margin-top: 20px">
<%
if(loginuser.getId().equals(dto.getId())){
	// 내가 쓴 글일 경우 
	%>
	<input type="button" onclick="location.href='pdsupdate.jsp?seq=<%=dto.getSeq() %>'" value="수정">
	<input type="button" onclick="location.href='pdsdelete.jsp?seq=<%=dto.getSeq() %>'" value="삭제">
	<input type="button" onclick="location.href='pdslist.jsp'" value="뒤로가기">	
	
	<%
}else{
	// 내글 아닐경우 
	%>
	<input type="button" onclick="location.href='pdslist.jsp'" value="뒤로가기">	
	
	
	<%
}


%>
</div>


</div>

</body>
</html>