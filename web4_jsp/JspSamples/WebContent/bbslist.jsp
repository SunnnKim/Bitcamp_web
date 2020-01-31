<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BBSDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
    	// 또는 request.getSession();
    	
    	String loginid = loginuser.getId();
    %>
<%!public String arrow (int depth){
	String rs = "<img src='./image/arrow.png' width='20px' height='20px'/> ";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	String ts = "";
	for(int i =0; i< depth; i++ ) {
		ts += nbsp;	// 앞에 부분의 여백
	}
	
	return depth==0? "": ts+rs ;
}%>


<%
	// paging 

String spageNumber = request.getParameter("pagenum");
int pageNumber = 0;
if(spageNumber !=null && !spageNumber.equals("")){
	pageNumber = Integer.parseInt(spageNumber);
}

System.out.println("pagenum: "+pageNumber);

BBSDao dao = BBSDao.getInstance();

List<BbsDto> list = dao.getBbsPageList(pageNumber);

// 총 글의 갯수
int len = dao.getAllBbs("","");
//System.out.println(len);

int bbsPage = len / 10;

if(len % 10 > 0 ) {	// 10(기준) 으로 나눈 나머지가 0 이상이면 다음 페이지도 만들어 준다
	bbsPage++;
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 게시판 -->

<h4 align="right" style="background-color: #f0f0f0">환영합니다 <%=loginid%>님,</h4>

<h1>BBS List</h1>

<a href="calEx/calendar.jsp">일정관리</a>


<div align="center">
<form>
<table>
<colgroup>
	<col width="100">
	<col width="400">
	<col width="140">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
</tr>
<tr>
	<td colspan="3" style="border-bottom: 3px solid;"></td>
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
					BbsDto bbs = list.get(i);
					if(bbs.getDel() == 1 ){
				%>
				<tr>
					<th><%= i+1 %></th>
					<td>
						해당 글은 삭제 되었습니다.
					</td>
					<td align="center"><%= bbs.getId() %></td>
				</tr>
			<%
			}
			else{
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
	}
%>

</table>
</form>
</div>


<div align="center">
<%
// 페이징

for( int i = 0 ; i < bbsPage; i++ ){
	if(pageNumber == i) {	// 현재 페이지
	%>
		<span>[<%=i+1 %>]</span>
	<%		
	}else{
	%>
	<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)" class="page-num">
		[<%=i+1 %>] 	
	</a>&nbsp; 
	<%		
		
	}
}
%>
</div>


<script type="text/javascript">
function goPage( page ) {
	location.href="bbslist.jsp?pagenum="+page;
}
</script>

<a href="bbswrite.jsp">글쓰기</a>

<a href="logout.jsp">로그아웃</a>

<div align="center">
<form action='searchbbs.jsp' method='get'>

<select name="optionpick"> 
	<option value="id">아이디</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
</select>
<input type="text" size="30" name="search" id="searchBox">
<input type="button" id="sbtn" onclick="searchBtn()" value="검색">
</form>


</div>

<script type="text/javascript">
function searchBtn() {
	var stext = document.querySelector("input[name='search']").value;
	if( stext == "") {
		alert('검색어를 입력하시오');
	}else{
		document.querySelector('#sbtn').type = "submit";
	}
}
</script>


</body>
</html>