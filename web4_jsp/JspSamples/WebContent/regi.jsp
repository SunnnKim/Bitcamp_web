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
<h1 style="text-align: center">회원가입</h1>
<p style="text-align: center">환영합니다</p>
<div align="center">
<form action="regiAf.jsp" method="post">

<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" id="id" name="id" size="20">
		id확인 
		<p id="idcheck" style="font-size: 8px"></p>
		<input type="button" id="btn" value="id확인">
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="pwd" size="20">
	</td>
</tr>
<tr>
	<td>이름</td>
	<td>
		<input type="text" name="name" size="20">
	</td>
</tr>
<tr>
	<td>이메일</td>
	<td>
		<input type="text" name="email" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="회원가입">
	</td>
</tr>

</table>

</form>
</div>
<script type="text/javascript">

$(document).ready(function() {
	$("#btn").click(function() {
		$.ajax({
			url: "checkid.jsp",
			type:"post",
			data: "id="+$("#id").val(),
			// date: { "id" : $("#id").val() } 	// json 데이터(여러개 보낼수 있음)
			success: function( data ) {
				console.log(data.trim());
				if(data.trim() == "false"){
					$('#idcheck').css('color', '#0000ff');
					$('#idcheck').html('사용할 수 있는 id입니다');
				}else{
					$("#id").val("");
					$('#idcheck').css('color', '#ff0000');
					$('#idcheck').html('사용중인 id입니다');
			}
			
			}
		
		});
	
	});
	
	
	
	
	
});

</script>
</body>
</html>