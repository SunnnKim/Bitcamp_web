<%@page import="java.util.Calendar"%>
<%@page import="calEx.CalendarDao"%>
<%@page import="calEx.CalendarDto"%>
<%@page import="dto.MemberDto"%>
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
	String year =  dto.getRdate().substring(0, 4);
	String month =  dto.getRdate().substring(4, 6);
	String day =  dto.getRdate().substring(6,8);
	String hour =  dto.getRdate().substring(8,10);
	String min =  dto.getRdate().substring(10);
	
	Calendar cal = Calendar.getInstance();
	
	String dday = year +"년 "+ month + "월 " + day + "일";
	
	// 범위를 설정하는 날짜
	int tyear = Integer.parseInt(year);
	int tmonth = Integer.parseInt(month);
	int tday = Integer.parseInt(day);
	int thour = Integer.parseInt(hour);
	int tmin = Integer.parseInt(min);

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
<form action="calupdateAf.jsp">
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
			<input type="text" value="<%=dto.getId()%>" size="30" readonly="readonly"> 
		</td>
	</tr>
	<tr>
		<td>작성일 </td>
		<td>
		<select name="year">
		<%
			for(int i = tyear - 5; i < tyear+6; i++){
				// 이 코드는 현재 선택한 년도를 selected로 두는 코드
				%>
				<option <%=year.equals(i+"")? "selected='selected'":"" %> value="<%=i%>"><%=i %></option>
				
				<%
			}
		%>	
		</select>년
		<select name="month">
		<%
			for(int i = 1; i <= 12; i++){
				// 이 코드는 현재 선택한 월을 selected로 두는 코드
				%>
				<option <%=month.equals(i+"")? "selected='selected'":"" %> value="<%=i%>"><%=i %></option>
				
				<%
			}
		%>	
		
		</select>월 
		<select name="day">
		<%
			for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				// 이 코드는 현재 선택한 월을 selected로 두는 코드
				%>
				<option <%=day.equals(i+"")? "selected='selected'":"" %> value="<%=i%>"><%=i %></option>
				
				<%
			}
		%>	
		</select>일
		<select name="hour">
		<%
			for(int i = 0; i <= 24; i++){
				// 이 코드는 현재 선택한 월을 selected로 두는 코드
				%>
				<option <%=(thour+"").equals(i+"")? "selected='selected'":"" %> value="<%=i%>"><%=i %></option>
				
				<%
			}
		%>	
		</select>시
		
		<select name="min">
		<%
			for(int i = 0; i < 60; i++){
				// 이 코드는 현재 선택한 월을 selected로 두는 코드
				%>
				<option <%=(tmin+"").equals(i+"")? "selected='selected'":"" %> value="<%=i%>"><%=i %></option>
				
				<%
			}
		%>	
		</select>분
		
	</td>
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
</form>
</div>
<script type="text/javascript">

// 월에 따른 날짜 개수 바꾸기
$(document).ready(function(){
	// document 읽은 후에 function 실행
	$('select[name="month"]').change( setDay );
	
});

function setDay() {
	
	// 해당 년도의 월을 통해서 마지막 날짜를 구한다.
	var year = $('select[name="year"]').val();
	var month = $('select[name="month"]').val();
	
	var lastday = (new Date(year, month, 0)).getDate();
	
	// alert(lastday);
	
	// select에 적용하기
	var str = "";
	for(var i =1; i <= lastday; i++ ){
		if(i== <%=day%>){
			str += "<option val='"+ i + "' selected='selected'>"+i+"</option>";
		}else{
			str += "<option val='"+ i + "'>"+i+"</option>";
		}
	}
	$("select[name='day']").html(str);
	<%-- //"' <%=day.equals(i+'')? \"selected='selected'\":'' %>' --%>
}


setDay();
</script>
</body>
</html>