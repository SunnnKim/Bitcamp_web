<%@page import="calendarEx.CalendarDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.MemberDto"%>
<%@page import="com.sun.org.apache.regexp.internal.recompile"%>
<%@page import="calendarEx.CalendarDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
// nvl 함수
public boolean nvl(String msg){
	return msg == null||msg.trim().equals("")?true:false;
}

// 날짜를 클릭하면, 그날의 일정이 모두 보이게 하는 callist.jsp로 이동하는 함수
public String callist(int year, int month, int day){
	String str = "";
	
	str += String.format("&nbsp;<a href='%s?year=%d&month=%d&day=%d'>", 
							"callist.jsp", year, month, day);
	str += String.format("%2d", day); 	// <a href="">날짜</a>
	str += "</a>";
		// <a href='callist.jsp?year=2020&month=02&day=05'>_5</a>
	return str;
}

// 일정을 기입하기 위해서 pen이미지를 클릭하면, calwrite.jsp로 이동하는 함수
public String showPen(int year, int month, int day){
	String str = "";
	
	String image = "<img src='../image/pen2.png' width='18px' height='18px'>";	
	str = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", 
							"calwrite.jsp", year, month, day, image);
	/*
		<a href='calwrite.jsp?year=2020&month=02&day=05'>
			<img src='./image/pen2.png' width='18px' height='18px'>
		</a>
	*/
	return str;
}

// 1 -> 01	2020/01/02
public String two(String msg){
	return msg.trim().length()<2?"0"+msg.trim():msg.trim();
}

public String makeTable(int year, int month, int day, List<CalendarDto> list){
	String str = "";
	
	// 2020 2 5 -> 20200205
	String dates = (year + "") + two(month + "") + two(day + "");
	
	str += "<table>";
	str += "<col width='98'>";
	
	for(CalendarDto dto : list){
		if(dto.getRdate().substring(0, 8).equals(dates)){
			str += "<tr bgcolor='#0000ff'>";
			str += "<td style='border:hidden'>";
			str += "<a href='caldetail.jsp?seq=" + dto.getSeq() + "'>";
			str += "<font style='font-size:8px;color:red'>";
			str += dot3(dto.getTitle());
			str += "</font>";
			str += "</a>";
			str += "</td>";
			str += "</tr>";
		}		
	}	
	str += "</table>";	
	return str;
}

// 일정 제목이 너무 길 때 ...으로 처리함수
public String dot3(String msg){
	String str = "";
	if(msg.length() >= 6){
		str = msg.substring(0, 6);
		str += "..."; 
	}else{
		str = msg.trim();	
	}
	return str;
}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar.jsp</title>
<link type="text/css" rel="stylesheet" href="../css/ui.css">
<link type="text/css" rel="stylesheet" href="../css/calendar.css">
</head>
<body>
<%
	Object ologin = session.getAttribute("login");
				// request.getSession().getAttribute(name)
	MemberDto mem = null;
	if(ologin == null){				
		%>
		<script type="text/javascript">
		alert("로그인 해 주십시오");
		location.href = "login.jsp";
		</script>
		<%
	}
	mem = (MemberDto)ologin;
%>	

<h4 align="right" style="background-color: #f0f0f0">환영합니다 <%=mem.getId() %>님 반갑습니다</h4>

<ul>
	<li><a href="../bbslist_css.jsp">게시판</a></li>
	<li><a href="./calEx/calendar.jsp">일정관리</a></li>	
	<li><a href="../pdslist.jsp">자료실</a></li>
</ul>

<hr>

<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE, 1);

String syear = request.getParameter("year");
String smonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
if(nvl(syear) == false){
	year = Integer.parseInt(syear);
}
int month = cal.get(Calendar.MONTH) + 1;
if(nvl(smonth) == false){
	month = Integer.parseInt(smonth);
}

if(month < 1){
	month = 12;
	year--;
}
if(month > 12){
	month = 1;
	year++;
}
cal.set(year, month - 1, 1);	// 연월일 셋팅 완료

// 요일
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

// <<	year--
String pp = String.format("<a href='%s?year=%d&month=%d'>"
										+ "<img src='../image/left.gif'></a>" ,
							"calendar.jsp", year-1, month);
// <	month--
String p = String.format("<a href='%s?year=%d&month=%d'>"
										+ "<img src='../image/prec.gif'></a>" ,
							"calendar.jsp", year, month-1);
// >	month++
String n = String.format("<a href='%s?year=%d&month=%d'>"
										+ "<img src='../image/next.gif'></a>" ,
							"calendar.jsp", year, month+1);
// >>	year++
String nn = String.format("<a href='%s?year=%d&month=%d'>"
										+ "<img src='../image/last.gif'></a>" ,
							"calendar.jsp", year+1, month);

CalendarDao dao = CalendarDao.getInstance();
List<CalendarDto> list = dao.getCalendarList(mem.getId(), year + two(month + ""));

%>

<div align="center">

<table border="1">
<col width="100"><col width="100"><col width="100"><col width="100">
<col width="100"><col width="100"><col width="100">

<tr height="100">
	<td colspan="7" align="center" style="padding-top: 20px">
		<%=pp %>&nbsp;&nbsp;<%=p %>&nbsp;
		<font color="black" style="font-size: 50px">
			<%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
		</font>
		<%=n %>&nbsp;&nbsp;<%=nn %>		
	</td>
</tr>

<tr height="50">
	<th align="center">일</th>
	<th align="center">월</th>
	<th align="center">화</th>
	<th align="center">수</th>
	<th align="center">목</th>
	<th align="center">금</th>
	<th align="center">토</th>
</tr>

<tr height="100" align="left" valign="top">
<%
// 위쪽 빈칸
for(int i = 1;i < dayOfWeek; i++){
	%>	
	<td style="background-color: #cecece">&nbsp;</td>
	<%
}
%>

<%-- 날짜 --%>
<%
int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i = 1;i <= lastday; i++){
	%>	
	<td><%=callist(year, month, i) %>&nbsp;&nbsp;<%=showPen(year, month, i) %>
		<%=makeTable(year, month, i, list) %>
	</td>	
	<%
	if((i + dayOfWeek - 1) % 7 == 0 && i != lastday){
		%>
		</tr><tr height="100" align="left" valign="top">
		<%
	}
}
%>

<!-- 밑칸 -->
<%
cal.set(Calendar.DATE, lastday);	// 그 달의 마지막 날짜
int weekday = cal.get(Calendar.DAY_OF_WEEK);
for(int i = 0;i < 7 - weekday; i++){
	%>	
	<td style="background-color: #cecece">&nbsp;</td>
	<%
}
%>

</tr>



</table>

</div>


</body>
</html>




