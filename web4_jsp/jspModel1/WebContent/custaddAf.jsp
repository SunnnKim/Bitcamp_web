<%@page import="dao.CustUserDao"%>
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
	// parameter 받아오기
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	
	// DB (backhand) 접근하기
	CustUserDao dao = CustUserDao.getInstance();
	boolean success = dao.addCustUser(id, name, address);
	if(success){
		// 다음 페이지로 이동
		// response.sendRedirect("custuserlist.jsp");
		// 또는
	%>
		<script type="text/javascript">
			alert("정상적으로 추가되었습니다.");
			location.href="custuserlist.jsp";
		</script>			
	<%
	}
	else{
		// 에러 났을 때
	%>
		<script type="text/javascript">
			alert("추가되지 않았습니다. 다시 추가해주세요");
			location.href="custadd.jsp";
		</script>			
	<%
	}
%>

</body>
</html>