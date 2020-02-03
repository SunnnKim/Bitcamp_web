<%@page import="dao.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String sseq = request.getParameter("seq");
System.out.println("seq: " + sseq);
int seq = Integer.parseInt(sseq);
// 삭제하기
PdsDao dao =PdsDao.getInstance();
boolean b = dao.deletePds(seq);

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
		alert('삭제되었습니다');
		location.href="pdslist.jsp";
	</script>
	<%
}
else{
	%>
	<script type="text/javascript">
		alert('삭제 실패!');
		location.href="pdslist.jsp";
	</script>
	<%
}


%>

</body>
</html>