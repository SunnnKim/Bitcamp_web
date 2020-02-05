<%@page import="dto.MemberDto"%>
<%@page import="dto.PdsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
PdsDao dao = PdsDao.getInstance();
List<PdsDto> list = dao.getPdsList();

MemberDto mem = (MemberDto)session.getAttribute("login");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="./css/style2.css">
<link type="text/css" rel="stylesheet" href="./css/ui.css">
</head>
<body>

<h4 align="right" style="background-color: #f0f0f0">환영합니다 <%=mem.getId() %>님 반갑습니다</h4>

<ul>
	<li><a href="./bbslist_css.jsp">게시판</a></li>
	<li><a href="./calEx/calendar.jsp">일정관리</a></li>	
	<li><a href="./pdslist.jsp">자료실</a></li>
</ul>
 
<hr>

<div align="center">

<table border="1">
<col width="70"><col width="100"><col width="400"><col width="100">
<col width="80"><col width="120"><col width="120">

<tr>
	<th>번호</th><th>작성자</th><th>제목</th><th>다운로드</th>
	<th>조회수</th><th>다운로드수</th><th>작성일</th>
</tr>

<%
if(list.size() == 0){
%>
	<tr>
		<td colspan="7">자료가 없습니다</td>
	</tr>
<%
}else{
	for(int i = 0;i < list.size(); i++){
		PdsDto pds = list.get(i);
		%>
		<tr align="center" height="5">
			<td align="center"><%=i + 1 %></td>
			<td><%=pds.getId() %></td>
			<td align="left">
				<a href="pdsdetail.jsp?seq=<%=pds.getSeq() %>">
					<%=pds.getTitle() %>
				</a>
			</td>
			<td>
				<input type="button" name="btndown" value="파일"
					onclick="location.href='filedown?filename=<%=pds.getFilename() %>&seq=<%=pds.getSeq() %>'">				
			</td>
			<td><%=pds.getReadcount() %></td>
			<td><%=pds.getDowncount() %></td>
			<td><%=pds.getRegdate() %></td>
		</tr>
		<%
	}
}
%>
</table> 
<br>

<a href="pdswrite.jsp">자료올리기</a>

</div>




</body>
</html>






