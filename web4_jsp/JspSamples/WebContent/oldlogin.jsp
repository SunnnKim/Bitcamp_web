<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.center{
	margin: auto;
	width: 60%;
	border: 3px solid #8ac007;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<!-- 쿠키에 저장할 수 있도록 하는 cdn -->
</head>
<body>

<h2 style="text-align: center;">Login Page</h2>

<div class="center">

<form action="loginAf.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" id="id" name="id" size="20">
		<input type="checkbox" id="chk_save_id">Save id
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td><input type="password" name="pwd" size="20"></td>
</tr>
<tr>
	<th colspan="2">
		<input type="submit" value="로그인">
		<button type="button" onclick="location.href='regi.jsp'">회원가입</button>
	</th>
</tr>


</table>
</form>
</div>

<script type="text/javascript">
/*
 session : java -> Server (login정보) Object
 cookie : javascript -> client 코드, 로그인 했던 id를 저장
 
 
 */
/* 
$.cookie("user_id", "abc123");	// 쿠키 생성 : 파라미터 2개(쿠키이름, 데이터) - setter
$.removeCookie("user_id", {path:"./"});	// (쿠키아이디, 경로) -> 삭제하기

 */
var user_id=$.cookie("user_id");	// jquery에서 쿠키를 접근하는 코드(파라미터 1개 - getter)
 
if(user_id != null) {
	// alert('cookie 있음');
	$("#id").val(user_id);
	$("#chk_save_id").attr("checked", "checked");
	
}

// 아이디 저장하기 
$("#chk_save_id").click(function() {
	if($("#chk_save_id").is(":checked")){
		// alert('체크됨');
		if( $('#id').val().trim() == "" ){
			alert('insert id');
			$("#chk_save_id").prop("checked", false);
		}else{
			// 쿠키 저장
			$.cookie('user_id', $("#id").val().trim(), { expires:7, path: './'} );	// 3번째 파라미터는 기한임
			
		}
	}else{
		//alert('체크없음');
		$.removeCookie("user_id", { path: "./"});
	}
});

</script>
</body>
</html>