<%@page import="assignment.InfoClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<h1>Jsp 화면</h1>
<form id="frm" action="NewFile.jsp">

<table>
<tr>
	<td>아이디</td>
	<td>
		<input type="text" id="id" name="id" value="">
	</td> 
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="password" name="pw">
	</td>
</tr>
</table>
<br>
취미<br>
<input type="checkbox" id="hobby" name="hobby" value="잠자기">잠자기
<input type="checkbox" id="hobby" name="hobby" value="노래하기">노래하기
<input type="checkbox" id="hobby" name="hobby" value="게임하기">게임하기
<br>
<br>


연령<br>
<input type="radio" id="age" name="age" value="10대" checked="checked">10대
<input type="radio" id="age" name="age" value="20대">20대
<input type="radio" id="age" name="age" value="30대">30대
<input type="radio" id="age" name="age" value="40대">40대
<input type="radio" id="age" name="age" value="50대">50대
<input type="radio" id="age" name="age" value="60대이상">60대이상

<br><br>
기타 하고싶은 말:<br>
<textarea rows="10" cols="50" style="overflow-y: scroll;" name="detail"></textarea>

<br><br>
<button type="submit" id="sumbit1Btn" >전송</button>
<button type="button" id="sumbit2Btn">전송</button>
<button type="reset" id="cancelBtn">취소</button>
</form>

<script type="text/javascript">
$(document).ready(function() {
	

	$("#sumbit2Btn").click(function() {
		// getParameter
		$("#frm").attr("action","NewFile1.jsp").submit();

	});
	
	
});
</script>



</body>
</html>