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
	// id들이 넘어옴
	String delArr[] = request.getParameterValues("delck");
	if( delArr != null ){
		for(int i=0; i < delArr.length; i++) {
			System.out.println(delArr[i]);
		}
	}
	
	CustUserDao dao = CustUserDao.getInstance();
	boolean b = dao.deleteCustusers(delArr);
	if(b){
		%>
		<script type="text/javascript">
			alert("성공적으로 삭제했습니다!");
			location.href="custuserlist.jsp";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
			alert("삭제 실패");
			location.href="custuserlist.jsp";
		</script>
		<%
	}
%>


</body>
</html>