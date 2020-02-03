<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%




Object obj =  request.getAttribute("list");
List<BbsDto> list = (List<BbsDto>)obj;
System.out.println(list.get(0));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script><style type="text/css">
.bbstitle{
	margin-left:30px;
	padding-left:10px;
	padding-right:10px;
	text-decoration: none;
	color: black;
}
a.bbstitle:visited{
	color: black;
}
a.bbstitle:hover{
	background-color: olive;
	color: black;
}

</style>
</head>
<body>
<h1>BBS</h1>

<div align="center">
<form name="frm" action="" method="get">
<table border="0">
<col width="100"><col width="600"><col width="150">
<thead>
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
</tr>
<tr>
	<td colspan="3" style="border-bottom: 3px  solid; padding-bottom: 10px"></td>
</tr>
</thead>
<tbody>
<% 
// 리스트가 없을 때
if(list.size()==0 || list == null ){
%>
	<tr>
		<td colspan="3" style="height: 300px; text-align: center;"> 글이 없습니다! </td>
	</tr>
<%
}

//  글이 있을 때 
else {
	for(int i=0; i<list.size(); i++){
		BbsDto bbs =list.get(i);
		%>
	<tr style="height: 40px;">
		<td style="text-align: center;"><%=(i+1) %></td>
		<td><a href='../bbsdetail' class='bbstitle'><%= bbs.getTitle()%></a></td>
		<td style="text-align: center; font-size: 13px"><%=bbs.getId() %></td>
	</tr>
		<%
	}
}

%>
<tr>
	<td colspan="3" style="border-bottom: 3px  solid; padding-bottom: 10px"></td>
</tr>
</tbody>
</table>

<!-- 페이징 -->
<div class="paging-list" align="center">


</div>

</form>

</div>

<script type="text/javascript">

	// ajax로 페이지 개수 받아오기
	$.ajax({
		url:"bbsgetpages",
		type:"get",
		data:"choice=&searchTxt=",
		success: function(data) {
			
			var pages = Math.ceil( data / 10 ) ;	// 페이지 수
			for(var i=0; i<pages; i++){
				if(i == "<%=%>")
				$(".paging-list").html("<a href='#'></a>")
			}
				
			
		}
		
		
		
	});
	
</script>


</body>
</html>