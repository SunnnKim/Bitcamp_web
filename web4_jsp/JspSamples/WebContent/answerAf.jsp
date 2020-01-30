<%@page import="dao.BBSDao"%>
<%@page import="dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	BBSDao dao = BBSDao.getInstance();
	BbsDto bbs = new BbsDto(id, title, content);
	boolean b = dao.answer(seq, bbs);
	if(b){
%>
		<script type="text/javascript">
			alert('답글이 성공적으로 추가되었습니다.')
			location.href="bbslist.jsp";
		</script>
	<%
	}else{
		
	%>
		<script type="text/javascript">
			alert('답글 추가 실패')
			location.href="bbslist.jsp";
		</script>
	<%	
	}
%>


</body>
</html>