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
			url: "data.jsp",
			datatype: "json",	// DB에서 접속하는 파일
			type: "get",			// jsp는 크게 상관없으나 servlet은 상관있음
			success: function ( obj ) {
				// alert('success');
				// alert( obj.num );	// undefined 나온다 : text로 넘어와서 (String 타입)
				
				// String -> json
				// : String으로 되있는 데이터 파싱하기
				var data = JSON.parse(obj.trim());
				alert( data.name );
				
				// JSON -> String
				// JSON.stringify( json변수 );
				var str = JSON.stringify(data);
				alert( str.name );	// 문자열이기 때문에 undefined나옴
				
			},
		error: function() {
			alert('error');
		}
		});
	});
});


</script>



</body>
</html>