<%@page import="dto.BbsDto"%>
<%@page import="calEx.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="calEx.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	// two함수
	// 한자리 숫자를 2자리로 만들어줌
	public String two(String msg){
		return msg.trim().length()<2? "0"+msg.trim(): msg.trim();
	}

%>    
<%
	//일정 seq 받아오기
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	System.out.println("year"+year);
	System.out.println("month"+month);
	System.out.println("day"+day);

	String rdate = year + two(month+"") + two(day+"");	// 디비에서 꺼내올때는 substring으로 짜른다
	
	// list 받아오기
	CalendarDao dao = CalendarDao.getInstance();
	List<CalendarDto> list = dao.getCalListByDay(rdate);
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><%=year %>/<%=month %>/<%=day %>  일정</h1>


<a href="calwrite.jsp?year=<%=year%>&month=<%=month%>&day=<%=day%>">일정 추가하기</a>



<div align="center">
<form>
<table>
<colgroup>
	<col width="100">
	<col width="400">
<tr>
	<th>번호</th>
	<th>제목</th>
</tr>
<tr>
	<td colspan="2" style="border-bottom: 3px solid;"></td>
</tr>
<%
	if(list== null || list.size() == 0){
		// 글이 없음
		%>
			<tr>
				<td colspan="2">일정이 없습니다.</td>
			</tr>
			
		<%
	}else{
			// 글이 있음
		for(int i=0; i < list.size(); i++) {
			CalendarDto dto = list.get(i);
		%>
		<tr>
			<th><%= i+1 %></th>
			<td style="text-align: center">
				<a href="caldetail.jsp?seq=<%=dto.getSeq() %>">
				<%= dto.getTitle() %></a>
			</td>
		</tr>
	<%
	}
			}
%>

</table>
</form>
</div>


<div align="center" style="margin-top: 50px">
<input type="button" onclick="location.href='calendar.jsp'" value="캘린더보기">

</div>

 	



</body>
</html>