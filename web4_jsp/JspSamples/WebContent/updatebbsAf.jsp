<%@page import="dao.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BBSDao dao = BBSDao.getInstance();
	boolean b = dao.updateBbs(title, content, seq);
	
	if(b){
	%>
		<script type="text/javascript">
			alert('수정되었습니다!');
			location.href="bbslist.jsp";
		</script>
	<%
	}else{
	%>
		<script type="text/javascript">
			alert('수정 실패');
			location.href="updatebbs.jsp?seq="+<%=seq%>;
		
		</script>
	<%
		
	}
	

%>

</body>
</html>