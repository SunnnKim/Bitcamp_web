<%@page import="dto.MemberDto"%>
<%@page import="calEx.CalendarDao"%>
<%@page import="calEx.CalendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 //session
  String loginid =((MemberDto) session.getAttribute("loginuser")).getId();

 
 %>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	System.out.println(seq);
	CalendarDto dto = CalendarDao.getInstance().getCalendarOne(seq);

	// 일정 날짜
	String dday = dto.getRdate().substring(0, 4)+"년 "+dto.getRdate().substring(4, 6) + "월 " + dto.getRdate().substring(6,8) + "일";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align ="center">
 <h1>글 보기 </h1>
<table border="1">
	<tr>
		<td>제목 : </td>
		<td><%=dto.getTitle()%>
		</td>
	</tr>
	<tr>
		<td>작성자 </td>
		<td><%=dto.getId()%>
		</td>
	</tr>
	<tr>
		<td> 일정 </td>
		<td> <%=dday%></td>
	</tr>
	<tr>
		<td colspan="2" height="200px">
		<%=dto.getContent() %>
		</td>
	</tr>
	<%
	if(dto.getId().equals(loginid)){
	%> 
		<tr>	
			<td colspan="2" style="text-align: center">
				<input type="button" onclick="location.href='calupdate.jsp?seq=<%=dto.getSeq() %>'" value="수정">
				<input type="button" onclick="location.href='caldelte.jsp?seq=<%=dto.getSeq() %>'" value="삭제">
				<input type="button" onclick="location.href='calendar.jsp'" value="목록보기">
			</td>
		</tr>
	<% }
	else {
		%> 
		<tr>	
			<td colspan="2" style="text-align: center">
				<input type="button" onclick="location.href='calendar.jsp'" value="목록보기">
			</td>
		</tr>
	<%
		
		
	}
	
	%>
	
</table>
</div>

</body>
</html>