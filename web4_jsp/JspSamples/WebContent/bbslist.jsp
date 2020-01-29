<%@page import="dto.BBSDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BBSDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
	// 또는 request.getSession();
	
	String loginid = loginuser.getId();
	
	
	BBSDao dao = BBSDao.getInstance();
	List<BBSDto> list = dao.getList();
	
	
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 게시판 -->
<h4 align="right" style="background-color: #f0f0f0">환영합니다 <%=loginid %>님,</h4>

<h1>BBS List</h1>
<div align="center">
<form>
<table border="1">
<colgroup>
	<col width="100">
	<col width="400">
	<col width="140">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
</tr>
<%
	if(list== null || list.size() == 0){
		// 글이 없음
		%>
		<tr>
			<td colspan="3">작성된 글이 없습니다.</td>
		</tr>
		
		<%
	}else{
		// 글이 있음
		for(int i=0; i < list.size(); i++) {
			BBSDto bbs = list.get(i);
		%>
			<tr>
				<th><%= i+1 %></th>
				<td>
					<%= arrow(bbs.getDepth()) %>
					<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
					<%= bbs.getTitle() %></a>
				</td>
				<td align="center"><%= bbs.getId() %></td>
			</tr>
		<%
		}
	}
%>

</table>
</form>
</div>

<a href="bbswrite.jsp">글쓰기</a>

<a href="logout.jsp">로그아웃</a>
<%
MemberDto dto = (MemberDto)session.getAttribute("loginuser");
if(dto==null){	// session 해방
	%>
		<script type="text/javascript">
			alert('로그인 만료!');
			location.href="login.jsp";
		</script>
	<%
}
%>

<%!

public String arrow (int depth){
	String rs = "<img src='./image/arrow.png' width='20px' height='20px'/> ";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	String ts = "";
	for(int i =0; i< depth; i++ ) {
		ts += nbsp;	// 앞에 부분의 여백
	}
	
	return depth==0? "": ts+rs ;
}

%>

</body>
</html>