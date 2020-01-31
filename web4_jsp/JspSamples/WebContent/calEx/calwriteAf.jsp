<%@page import="calEx.CalendarDto"%>
<%@page import="calEx.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%! // utility
//한자리 숫자를 2자리로 만들어줌
	public String two(String msg){
		return msg.trim().length()<2? "0"+msg.trim(): msg.trim();
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

System.out.print("id : " + id);
System.out.print(" title : " + title);
System.out.print(" content : " + content);
System.out.print(" year : " + year);
System.out.print(" month : " + month);
System.out.print(" day : " + day);
System.out.print(" hour : " + hour);
System.out.print(" min : " + min);

// 2020/01/13 14:22 - > 202001131422 로 만들기
String rdate = year+ two(month) + two(day) + two(hour)+ two(min);

CalendarDao dao = CalendarDao.getInstance();

boolean b = dao.addCalendar(new CalendarDto(id, title, content, rdate));

%>
<%
if(b){
	
	%>
		<script type="text/javascript">
			alert('일정을 추가했습니다.');
			location.href="calendar.jsp";
		</script>
	<%
	
}else{

	%>
		<script type="text/javascript">
			alert('일정추가 실패');
			location.href="calendar.jsp";
		</script>
	<%
	
	/*
	
	callist.jsp => 일별 일정이 모두 출력
	caldetail.jsp => 그 일정의 내용
		calupdate.jsp -> 수정
		caldelete.jsp -> db에서 그냥 삭제함
	
	*/
}
%>
</body>
</html>