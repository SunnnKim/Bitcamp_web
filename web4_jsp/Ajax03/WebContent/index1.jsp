<%@page import="java.util.HashMap"%>
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

<p id="demo"></p>
<button type="button">click</button>

<script type="text/javascript">


$(function() {
	
	// model1 : 
	$("button").click(function(){
		$.ajax({
			url: "./custuser",	// servlet으로 간다는 의미
			type: "get",
			datatype: "json",
			data: "id=abc&pwd=123" ,	//	데이터 보내기
			// 데이터 받기
			success: function ( json ) {
				//alert("success");

				// 1. 서블릿에서 아무 데이터타입이나 하나만 가져와서 가져오기 -성공
/*
				alert(json);
				var data = JSON.parse( json );
				alert( data.name );
*/			
				// 2. 서블릿에서 다수의 데이터를 가져오기
				// alert(json.map.title);
				alert(json.map.list);
				var v = json.map.list;
				alert(v[0].number);	// list의 number 확인하기 
				// 꼭 jar파일 추가하기!!!!!!!!
				
				// req.setAttribute 방법 찾아보기
				
			},
			error: function () {
				
			}
		
		
		});
	});
});

</script>
</body>
</html>