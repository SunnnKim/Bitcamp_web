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
var target = [];
var link = [];
var aname = [];


$(function () {
	$("button").click(function () {
		$.ajax({
			url: "data.xml",
			datatype: "xml",
			success: function ( data ) {
				// alert('success');
				
				// xml 넣기
				var xml = $(data).find("xmldata"); // 루트태그 찾기
				var len = xml.find("news").length; // 루트태그의 길이값
				// alert(len);
				
				// xml 데이터 뿌리기
				for(i = 0; i< len ; i++ ) { 
					target[i] = xml.find("news").eq(i).find("target").text();					
					link[i] = xml.find("news").eq(i).find("link").text();					
					aname[i] = xml.find("news").eq(i).find("aname").text();		
				}
				for(i = 0; i< len ; i++ ) { 
					$("#demo").append(target[i] + " " );
					$("#demo").append(link[i] + " " );
					$("#demo").append(aname[i] + "<br>" );
				}
				
			},
			error: function(){
				alert('fail');
			}
			
		});
		
		
	});
});
</script> 
 
</body>
</html>