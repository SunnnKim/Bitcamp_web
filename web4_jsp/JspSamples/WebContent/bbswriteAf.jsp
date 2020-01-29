<%@page import="dao.BBSDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="dto.BBSDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	
	BBSDto dto = new BBSDto(id, title, content);
	
	boolean b = BBSDao.getInstance().writeBbs(dto);

	
	/*
		-- dto --
	ref, step, depth = 0
	wdate = Date()
	del = 0
	readcount = 0

	SEQ ID REF STEP	DEPTH TITLE	CONTENT WDATE 
	DEL READCOUNT 

	
	*/

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(b){
	%>
		<script type="text/javascript">
			alert('글 추가 성공!');
			location.href = "bbslist.jsp";
		</script>
	<%
}
else{
	%>
		<script type="text/javascript">
			alert('글 추가 실패!');
			location.href = "bbswrite.jsp";
		</script>
	<%
	
}
%>
</body>
</html>