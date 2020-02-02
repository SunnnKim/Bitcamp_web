<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%




Object obj =  request.getAttribute("list");
//List<BbsDto> list = (List<BbsDto>)obj;
//System.out.println(list.get(0));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
<h1>BBS</h1>

<div align="center">
<form name="frm" action="" method="get">
<table border="1">
<col width="100"><col width="600"><col width="150">
<thead>
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
</tr>
</thead>
<!--리스트가 없을 때 -->
<tbody>
<tr>
	<td colspan="3" style="height: 300px; text-align: center;"> 글이 없습니다! </td>
</tr>
</tbody>
<!-- 글이 있을 때 -->




<!-- 페이징 -->


</table>
</form>

</div>


<script type="text/javascript">
// 글 리스트 모두 불러오기

$.ajax({
	url: "../bbslist",
	dataType:"json",
	data:"page=0",
	success: function ( data ) {
		alert('success');
		console.log(data);
	}
});

 
</script>



</body>
</html>