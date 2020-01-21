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
<!-- html를 이용해서 데이터 넘기기 (form) -->
html를 이용해서 데이터 넘기기 (form)<br><br>

<%
String address = "서울시";
%>

<form action="NewFile.jsp" method="get">

	<input type="text" name="age" value="10"><br>
	<input type="text" name="addr" value="<%=address%>"><br>
	<input type="hidden" name="command" value="<%="비밀데이터"%>"><br>
	<!-- hidden : 화면에는 출력되지 않는 데이터 -->
	<input type="submit" value="전송">
	
	
</form>

<br><br>

javaScript 이용해서 데이터 넘기기 <br>

<form action="NewFile.jsp" method="get"><br>
	<input type="text" id="name" value="홍길동"><br>
	<input type="text" id="email" value="hgd@naver.com"><br><br>
	<button type="button" onclick="sendData()">전송</button><br>
</form>
<script type="text/javascript">
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	
function sendData() {
	location.href="NewFile1.jsp?name="+ name +"&email="+email;
}

</script>

<br><br>
Jquery를 이용해서 데이터 보내기
<!-- Jquery를 이용해서 데이터 보내기 -->
<br><br>

<form action="NewFile2.jsp" id="frm">
	<input type="text" id="age" name="age" value="10"><br>
	<input type="text" id="addr" name="addr" value="<%=address%>"><br><br>	
	
	<input type="button" value="전송" id="btn">
</form>

<script type="text/javascript">

$(document).ready(function () {
	$("#btn").click(function () {
		// alert("check");
		$("#frm").submit();


	});



});


</script>




</body>
</html>