<%@page import="calendarEx.CalendarDto"%>
<%@page import="calendarEx.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    

<%!
public String two(String msg){
	return msg.trim().length()<2?"0"+msg.trim():msg.trim();
}
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String hour = request.getParameter("hour");
String min = request.getParameter("min");

System.out.println(id + " " + title + " " + content);
System.out.println(year + " " + month + " " + day + " " + hour + " " + min);

// 20200131422
String rdate = year + two(month) + two(day) + two(hour) + two(min);

CalendarDao dao = CalendarDao.getInstance();

boolean isS = dao.addCalendar(new CalendarDto(id, title, content, rdate));

if(isS){
%>
	<script type="text/javascript">
	alert("일정이 추가되었습니다");
	location.href = "calendar.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("일정을 추가하지 못했습니다");
	location.href = "calendar.jsp";
	</script>
<%
}
%>

<%--
	4. callist.jsp -> 일별 일정이 모두 출력 
	1. caldetail.jsp -> 그 일정의 내용
		2. calupdate.jsp 	
		3. caldelete.jsp	-> DB에서 삭제

 --%>



</body>
</html>






