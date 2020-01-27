<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>custuserdetail</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
td{
	padding: 10px;
}
th, td{
	text-align: center;
}
</style>
</head>
<body>

<%
String id = request.getParameter("id");
%>
	<h1 align="center">Customer Detail</h1>


<div align="center">

<form action="custuserupdate">
<table>
	<col width="100">
	<col width="300">
	<tr>
		<td colspan="2" height="1" bgcolor="#00000"></td>
	</tr>
	<tr>
		<th>ID</th>
		<td>
			<input type="text" size="30" class="id" disabled="disabled">
			 <input type="hidden" name="id" value="<%=id%>"> 
		</td>
	</tr>
	<tr>
		<th>NAME</th>
		<td>
			<input type="text" size="30" name="name" class="name" disabled="disabled"> 
		</td>
	</tr>
	<tr>
		<th>ADDRESS</th>
		<td>
			 <input type="text" size="30" name="address" class="address" disabled="disabled">
		</td>
	</tr>
	<tr>
		<td colspan="2" height="1" bgcolor="#00000"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" id="updateBtn" value="수정"> 
			<button type="button" onclick="del()">삭제</button> 
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="back()" style="width:100px ">뒤로가기</button>
		</td>
	</tr>

</table>
</form>

</div>



<script type="text/javascript">
function back() {
	location.href="custuserlist.html";
}
function del() {
	// 삭제하는 메소드
	var a = document.getElementsByName("id")[0].value;
	//location.href="custuserdel?command=one&id="+a;
	$.ajax({
		url:"custuserdel",
		data:"command=one&id="+a,
		type:"get",
		datatype:"text",
		success: function( data ) {
			console.log(data);
			if(data === "true"){
				alert('삭제성공!');
				location.href="custuserlist.html";
			}else{
				alert('Fail');
			}
		}
	});
}
// 수정하n 
$(document).on("click", "#updateBtn", function() {
	if($(".address").attr("disabled") == "disabled"){
		// 수정하려고할때
		$(".address").attr("disabled",false);
		return;
	}
	
	else{
			
		$("#updateBtn").attr("type","submit");
	}
		
});
</script>
<script>

var id = "<%=id%>";

// ajax
	$.ajax({
		url:"custuserdetail",
		type:"get",
		datatype: "json",
		data:"id="+id,
		success: function( data ){
			$(".id").attr("value", data.id);
			$(".name").attr("value", data.name);
			$(".address").attr("value", data.address);
		}
	});


</script>
</body>
</html>