<%@page import="dao.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	BBSDao dao = BBSDao.getInstance();
	boolean b = dao.deletebbs(seq);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
<%
	if(b){
		%>
		alert('삭제 성공');
		location.href="bbslist.jsp";
		<%
	}
	else{
		%>
		alert('삭제 실패');
		location.href="bbsdetail.jsp?seq="+<%=seq%>;
		<%
	}
%>
		

</script>
</body>
</html>