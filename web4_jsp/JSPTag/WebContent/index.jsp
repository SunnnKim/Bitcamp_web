<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--

	forward, include(불러오기) -> iframe 이랑 비슷
	
--%>

<!-- include : 다른 페이지 불러다가 씀 (=include) -->

<h3>index.jsp start</h3>
<jsp:include page="NewFile.jsp"></jsp:include>
<h3>index.jsp end</h3>

<!-- forward : 페이지 이동 -->
<%-- <jsp:forward page="NewFile.jsp"/> --%>
<!-- 
EL, Core에 없는 부분:
	MemberDto = new MemberDto()
	와 같은 객체 생성부분은 없음
 -->
<%--
	MemberDto mem = new MemberDto();
	mem.setMsg("하이");
	
	String msg = mem.getMsg();
	
	아래는 위와 같은 코드임
--%>
<!-- jsp코드로 생성하는 태그 : useBean -->
<jsp:useBean id="mem" class="dto.MemberDto"></jsp:useBean> <!-- constructor : id = 객체명  -->
<jsp:setProperty property="msg" name="mem" value="하염"/> <!-- setter:  name = 객체명  -->
<jsp:getProperty property="msg" name="mem"/> 	<!-- getter -->


message: ${ mem.msg }








</body>
</html>