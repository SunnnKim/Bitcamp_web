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

<!-- GSON  -->
<p id="demo"></p>
<button type="button">click</button>

<script>
$(document).ready(function () {
	$("button").click(function() {
		
		// 버튼 클릭시 
		
		$.ajax({
			url:"./hello" ,	// servlet 으로 보냄
			type:"post",
			datatype: "json",
			data:"number=1&name=홍길동",
			success: function( data , status, xhr ) {
				// alert('success');
				// alert(data); // gson 데이터 확인하기 
				alert(data[0].number +", "+ data[0].name);	// gson데이터 객체 확인하기
				
				$.each( data, function(i, val) {
					$("#demo").append("i: "+i+" number : " + val.number + ', name : ' + val.name +"<br>");
				});
				
				
			},
			error: function() {
				alert('실패');
			}
		});
		
		
	});
	
	
});

</script>

</body>
</html>