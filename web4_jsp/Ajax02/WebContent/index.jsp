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

<!-- 
	Spring boot 	->	 Ajax : Json, (xml)
	view(client) 			model(server)
	Ajax					get/post, send
	-> Vue, react

 -->
 
 <p id="demo"></p>
<button type="button">click</button>
 
 
 <script type="text/javascript">
 
 $(function() {
	
	 $("button").click(function() {
			
		 $.ajax({
			url: "data.json",	// json 파일 가져오기
			type: 'get',
			datatype: 'json',
			success:function( json, status, xhr ) {
				
				// 항상 success부터 확인하기
				// alert('sucess');
				// alert(json);
				
				// 키와 밸류가 넘어오는 형식은 배열로되어있다
				// 데이터 사용하기 위해서는 인덱스와 키값으로 접근한다.
				// alert(json[0].name + json[0].age );
				
				/*
				for( i =0 ; i< json.length; i++ ) { 
					$("#demo").append(json[i].name + " ");
					$("#demo").append(json[i].age + " ");
					$("#demo").append(json[i].address + " ");
					$("#demo").append(json[i].phone + " ");
				}
				*/
				
				// for-each 문
				$.each ( json, function( index, item ) {	// index는 인덱스번호의 변수이름, item 은 Object
					$("#demo").append(index + " "); 
					$("#demo").append(item.name + " "); 
					$("#demo").append(item.age + " "); 
					$("#demo").append(item.address + " "); 
					$("#demo").append(item.phone + " <br>"); 
				})
				
				
				
			},
			error: function(){
				alert("fail");
			}
			
			
		 });
		 
	});
});
 
 </script>

</body>
</html>