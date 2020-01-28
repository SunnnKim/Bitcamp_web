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
	
	Calendar cal = Calendar.getInstance();
	String today = cal.get(Calendar.YEAR) + "-";
	today += (cal.get(Calendar.MONTH)+1) + "-";
	today += cal.get(Calendar.DATE) + "";
	
	System.out.println(today);
	
	BBSDto dto = new BBSDto(id, title, content);
	dto.setRef(0);
	dto.setStep(0);
	dto.setDepth(0);
	dto.setWdate(today.trim());
	
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