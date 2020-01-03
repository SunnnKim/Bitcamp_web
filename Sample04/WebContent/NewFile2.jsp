<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// checkBox 데이터 하나만 가져올 때
// request.getParameter("name 명");

String jobs[] = request.getParameterValues("job");
// 데이터 여러개가 배열로 넘어온다 (이 경우에서는 선택된 배열이 넘어옴)
if(jobs != null && jobs.length > 0 ){
	for(String s : jobs){
		System.out.println(s);
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>