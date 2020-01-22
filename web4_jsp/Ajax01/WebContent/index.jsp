
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

<%--
	AJAX : Asynchronous Javascript And Xml
	목적 : 비동기 상태로 데이터를 송수신의 목적
	
	synchronous : 동기
	CustUserAdd.jsp -> CustUserAddAf.jsp
	form		name	DB insert
	
	
	Asynchronous : 비동기
	CustUserAdd.jsp <- DB, Controller, Dao
	현재 form을 유지한 상태로 데이터 통신을 수행한다
	(현재 페이지 유지)
	
	- JQuery소속
	
 --%>

<p id="demo"></p>
<button type="button">click</button>

<script type="text/javascript">
$(function () {
	
//	$("button").click(function() {
	$("button").on("click",function() {
		// on 이용

		// 밖에 있는 데이터 파일 불러다가 던지는 형태 
		// $("#demo").load("data.html");
		
		// 특정 데이터만 불러오기
		// $("#demo").load("data.html #data2");
		
		
		// 
		// $("#demo").load("data.jsp", "t1=abc&t2=가나다");
		
		//
		// $("#demo").load("data.jsp", { t1 : "abc" , t2 : "라마다"});
		
		
		$("#demo").load("data.jsp", { t1 : "abc" , t2 : "라마다"}, function (data, status, xhr) {
			//alert(data);
			$("#demo").append("data = " + data + "<br>");
			$("#demo").append("status = " + status + "<br>");
			$("#demo").append("xhr = " + xhr + "<br>");
			
		});

	
	});
		
	
});

</script>
</body>
</html>