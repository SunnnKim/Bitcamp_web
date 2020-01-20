<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>-- 입력 페이지 --</p>
이름 : <input type="text" id="name" name="name"><br><br>
생년월일 : <input type="text" id="birth" name="birth"><br><br>
<button type="button" onclick="clickBtn()"> OK </button>


<script type="text/javascript">
function clickBtn() {
	var name = document.getElementById("name").value;
	var birth = document.getElementById("birth").value;
	location.href="NewFile.jsp?name="+name+"&birth="+birth;
}


</script>


</body>
</html>