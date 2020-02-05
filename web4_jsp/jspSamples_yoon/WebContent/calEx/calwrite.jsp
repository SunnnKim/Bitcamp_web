<%@page import="java.util.Calendar"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

MemberDto mem = (MemberDto)session.getAttribute("login");

System.out.println("year:" + year);
System.out.println("month:" + month);
System.out.println("day:" + day);

// 범위를 설정하는 날짜. 기준
Calendar cal = Calendar.getInstance();

int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH) + 1;	// 0 ~ 11
int tday = cal.get(Calendar.DATE);
int thour = cal.get(Calendar.HOUR_OF_DAY);
int tmin = cal.get(Calendar.MINUTE);

%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calwrite.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<h1>일정 추가</h1>

<div align="center">

<form action="calwriteAf.jsp" method="post">

<table border="1">
<col width="200"><col width="500">
<tr>
	<td>아이디</td>
	<td>
		<%=mem.getId() %>
		<input type="hidden" name="id" value="<%=mem.getId() %>">		
	</td>
</tr>
<tr>
	<td>제목</td>
	<td>
		<input type="text" size="60" name="title">
	</td>
</tr>
<tr>
	<td>일정</td>
	<td>
		<select name="year">
		<%
			for(int i = tyear - 5;i < tyear + 6 ; i++){
				%>	
				<option <%=year.equals(i + "")?"selected='selected'":"" %>
								value="<%=i %>">
					<%=i %>	
				</option>
				<%
			}		
		%>		
		</select>년
		
		<select name="month">
		<%
			for(int i = 1;i <= 12 ; i++){
				%>	
				<option <%=month.equals(i + "")?"selected='selected'":"" %>
								value="<%=i %>">
					<%=i %>	
				</option>
				<%
			}		
		%>		
		</select>월
		
		<select name="day">
		<%
			for(int i = 1;i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>	
				<option <%=day.equals(i + "")?"selected='selected'":"" %>
								value="<%=i %>">
					<%=i %>	
				</option>
				<%
			}		
		%>		
		</select>일
		
		<select name="hour">
		<%
			for(int i = 0;i < 24; i++){
				%>	
				<option <%=(thour + "").equals(i + "")?"selected='selected'":"" %>
								value="<%=i %>">
					<%=i %>	
				</option>
				<%
			}		
		%>		
		</select>시
		
		<select name="min">
		<%
			for(int i = 0;i < 60; i++){
				%>	
				<option <%=(tmin + "").equals(i + "")?"selected='selected'":"" %>
								value="<%=i %>">
					<%=i %>	
				</option>
				<%
			}		
		%>		
		</select>분		
	</td>
</tr>

<tr>
	<td>내용</td>
	<td>
		<textarea rows="20" cols="60" name="content"></textarea>
	</td>
</tr>

<tr>
	<td colspan="2">
		<input type="submit" value="일정추가">
	</td>
</tr>

</table>

</form>

</div>

<script type="text/javascript">
//setday();
$("select[name='day']").val("<%=day %>");

$(document).ready(function () {	
	$("select[name='month']").change( setday );	
});

function setday() {
	// 해당년도의 월을 통해서 마지막 날짜를 구한다.
	var year = $("select[name='year']").val();
	var month = $("select[name='month']").val();
	
	var lastday = (new Date(year, month, 0)).getDate();
//	alert(lastday);
	
	// select 날짜 적용
	var str = "";
	for(i = 1;i <= lastday; i++){
		str += "<option value='" + i + "'>" + i + "</option>";
	}
	$("select[name='day']").html( str );
}



</script>



</body>
</html>





