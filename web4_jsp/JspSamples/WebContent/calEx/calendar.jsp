<%@page import="calEx.CalendarDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.MemberDto"%>
<%@page import="calEx.CalendarDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%! // utility 함수
	//nvl함수
	public boolean nvl(String msg){
		return msg == null || msg.trim().equals("")?true:false;
	}
	
	// 날짜를 클릭하면 그날의 일정이 모두 보이게 하는 callist 함수 
	public String callist (int year, int month, int day){
		String str = "";
		str = String.format("<a href='%s?year=%d&month=%d&day=%d'>", "callist.jsp", year, month, day);
		// <a href='callist.jsp?year=2020&month=1&day31'>
		
		str += String.format( "%2d", day);	// <a href>day, 2자리 숫자로 만들어주기(칸 맞추기 위함)
		str += "</a>";	// <a href>day</a>

		// 출력 예-> <a href='callist.jsp?year=2020&month=1&day31'>31</a>	---> 1월 31일 일정을 클릭햇을 때
		return str;
	}
	
	
	// 일정을 기입하기 위해서 pen이미지를 클릭하면 calwrite.jsp로 이동하는 함순
	public String showPen(int year, int month, int day){
		
		String str = "";
		// 이미지 소스넣기
		String image = "<img src='../image/pen2.png' width='18px' height='18px' />";
		
		str= String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", "calwrite.jsp", year, month, day, image);
		
		// 완성된 태그
		// <a href='calwrite.jsp?year=2020&month=01&day=31'>
		// 		<img src='./image/pen2.png' width='18px' height='18px' />
		// </a>
		return str;
	}
	
	// 한자리 숫자를 2자리로 만들어줌
	public String two(String msg){
		return msg.trim().length()<2? "0"+msg.trim(): msg.trim();
	}
	
	// 일정 제목이 너무 길 때 ... 으로 처리함
	public String dot3(String msg){
		String str ="";
		if(msg.length() >= 6 ){
			str = msg.substring(0,6);
			str += "...";
		}else{
			str = msg.trim();
		}
		return str;
	}
	
	// 날짜별로 안에 들어가는 일정 테이블을 만드는 함수 (최대 5개까지)
	public String makeTable(int year, int month, int day, List<CalendarDto> list){	//list = 하루의 일정들 list
		String str = "";
		
		// 2020/02/05 (넘어올 때) -> 20200205로 바꾸어 주기
		String dates = (year+"") + two(month+"") + two(day+"");
		
		str += "<table>";
		str += "<col width='98'>";
		for(CalendarDto dto : list){
			if(dto.getRdate().substring(0, 8).equals(dates)){		// 해당 월까지 가져오기 (시작위치, 끝-1인덱스)
				str += "<tr bgcolor='transparent'>";
				str += "<td style='border:hidden;'>";
				str += "<a href='caldetail.jsp?seq="+dto.getSeq()+"'>";
				str += "<font style='font-size:10px;color:red;'>";
				str += dot3(dto.getTitle());	
				str += "</font>";
				str += "</td>";
				str += "</tr>";
			
			}
		}
		str += "</table>";
		return str;
	}
%>
<%
//session
MemberDto dto = (MemberDto)session.getAttribute("loginuser");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
if(dto==null){	
	// session 해방
	%>
		<script type="text/javascript">
			alert('로그인 만료!');
			location.href="login.jsp";
		</script>
	<%
}
%>

<h1>일정관리</h1>
<hr>
<%

Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE, 1);	// 현재 달의 1일로 맞춰주기
String syear = request.getParameter("year");
String smonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
if( !nvl(syear) ){	// syear이 null일때 true / 값이 있을 때 false
	// 파라미터가 넘어온 경우
	year = Integer.parseInt(syear);
}

int month = cal.get(Calendar.MONTH)+1;
if ( !nvl(smonth) ) {// smonth이 null일때 true / 값이 있을 때 false
	// 파라미터가 넘어온 경우
	month = Integer.parseInt(smonth);
}

// 이전년도 달력 보기
if(month < 1 ) {
	month = 12;
	year --;
}
// 다음년도 달력보기
if(month > 12 ) {
	month = 1;
	year++;
}

cal.set(year, month-1, 1);	// 연월일 세팅완료


// 요일 구하기
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);	// 0:일요일~6:토요일

// 이미지 <<	: year - 1 
String pp = String.format("<a href='%s?year=%d&month=%d'><img src='../image/left.gif'></a>", "calendar.jsp",year-1, month);
// 이미지 <	: month - 1
String p = String.format("<a href='%s?year=%d&month=%d'><img src='../image/prec.gif'></a>", "calendar.jsp",year, month-1);
// 이미지 >	: month + 1
String n = String.format("<a href='%s?year=%d&month=%d'><img src='../image/next.gif'></a>", "calendar.jsp",year, month+1);
// 이미지 >>	: year + 1
String nn = String.format("<a href='%s?year=%d&month=%d'><img src='../image/last.gif'></a>", "calendar.jsp",year+1, month);



// dao 불러오기
CalendarDao dao = CalendarDao.getInstance();
List<CalendarDto>list = dao.getCalendarList(dto.getId(), year+ two(month+""));

%>


<div align="center">
<table border="1">
<col width="100"><col width="100"><col width="100"><col width="100"><col width="100"><col width="100"><col width="100">
<tr height="100">
	<td colspan="7" align="center" style="padding-top:20px;">
		<%=pp %>&nbsp;&nbsp;<%=p %>&nbsp; <!--여기의 구조는 :  << < 날짜 > >>  -->
		<font color="black" style="font-size: 50px">
			<%=String.format("%d년&nbsp;%2d월", year, month) %>
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
	// 위쪽 빈칸 구하기 = 구한 요일로 사용하기 (dayOfWeek)
	for(int i=1; i<dayOfWeek; i++ ){
	%>
		<td style="background-color: #cecece">&nbsp;
		</td>
	<%
	}
	// 날짜구하기
	int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	for(int i=1; i<= lastday; i++) {
	%>
		<td>
		<%=callist(year, month, i) %>&nbsp;&nbsp;<%=showPen(year, month, i) %>
		<%=makeTable(year, month, i, list) %>
		
		</td>
	
	<%
		if((i + dayOfWeek -1 ) % 7 == 0 && i != lastday){
		%>
		</tr>
		<tr height="100" align="left" valign="top">
		<%
		}
	}
	
%>


<%
// 밑 빈칸 만들기
cal.set(Calendar.DATE, lastday);	// 마지막 날짜로 세팅
int weekday =cal.get(Calendar.DAY_OF_WEEK);

for(int i=0; i < 7- weekday; i++ ){
	%>
		<td style="background-color: #cecece">&nbsp;
		</td>
	<%
}


%>
</tr>



</table>


</div>




</body>
</html>