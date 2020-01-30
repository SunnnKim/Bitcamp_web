<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.center{
	margin: auto;
	width: 60%;
	border: 3px solid #8ac007;
	padding: 10px;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

</head>
<body>

<h2>Login Page</h2>

<div class="center">

<form action="loginAf.jsp" method="post">

<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" id="id" name="id" size="20"><br>
		<input type="checkbox" id="chk_save_id">Save id		
	</td>	
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="password" name="pwd" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="로그인">
		<button type="button" onclick="location.href='regi.jsp'">회원가입</button>
	</td>
</tr>
</table>

</form>
</div>

<script type="text/javascript">
/*
	session : Java -> Server (login한 정보) Object
	cookie : Java Script -> Client (login했던 id)

	$.cookie("user_id", "abc123");	// 쿠키 생성
	$.removeCookie("user_id", { path:'./'});	// 쿠키 삭제
*/

var user_id = $.cookie("user_id");
if(user_id != null){
//	alert("쿠키 있음");
	$("#id").val(user_id);
	$("#chk_save_id").attr("checked", "checked");
}

$("#chk_save_id").click(function () {
	
	if($("#chk_save_id").is(":checked")){
	//	alert("체크됨");
		if( $("#id").val().trim() == "" ){
			alert("ID를 입력해 주십시오");
			$("#chk_save_id").prop("checked", false);
		}else{
			// 쿠키저장
			$.cookie("user_id", $("#id").val().trim(), { expires:7, path:'./' });
		}
	}else{
		$.removeCookie("user_id", { path:'./' });
	}
	
});



</script>



</body>
</html>




