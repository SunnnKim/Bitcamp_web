<%@page import="dao.PdsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8") ;%>
<html>
<head>
<title>pdsdel</title>
</head>

<body>
<%
String pdsid = request.getParameter("pdsid");
int seq = Integer.parseInt(request.getParameter("pdsseq"));
MemberDto user=(MemberDto)session.getAttribute("login");

PdsDao dao = PdsDao.getInstance();
boolean isS = dao.delPDS(seq);
if(isS){
	%>
	<script type="text/javascript">
	alert('성공적으로 삭제했습니다!');
	location.href='pdslist.jsp';
	</script>
	<% 
}else{
	%>
	<script type="text/javascript">
	alert('삭제 실패했습니다!');
	location.href='pdslist.jsp';
	</script>
	<% 
}
%>
</body>
</html>