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
<!-- ajax 실습: 받는게 목적 -->

<p id="demo"></p>
<button type="button">click</button>

<script type="text/javascript">
$(function () {
	$("button").click(function () {
		$.ajax( { 
			// 송신용
			url: "data.jsp",	// 가야할 공의 링크주소
			type: "get",		// get/post
			//data: "t1=xyz&t2=자차카", // 보내주는 파라미터
			data: {t1:"home", t2:"성공"},
			
			// 수신용
			success: function(data, status, xhr) {
				// alert("성공");
				alert(status);
				alert(xhr);
				$("#demo").text(data);
			},
			error: function (xhr, staus, error) {
				alert("실패");
				 
			},
			conplete : function(xhr, status) {
				alert("통신종료");
			}
		});		
		
	});
});

</script>

</body>
</html>