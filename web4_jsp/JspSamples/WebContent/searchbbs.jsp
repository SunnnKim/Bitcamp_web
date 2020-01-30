<%@page import="java.util.List"%>
<%@page import="dao.BBSDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
  	MemberDto loginuser = (MemberDto)session.getAttribute("loginuser");
  	// 또는 request.getSession();
  	
  	String loginid = loginuser.getId();
  %>

<%
	// paging 
	
String search = request.getParameter("search");
String optionpick = request.getParameter("optionpick");
	
String spageNumber = request.getParameter("pagenum");
int pageNumber = 0;
if(spageNumber !=null && !spageNumber.equals("")){
	pageNumber = Integer.parseInt(spageNumber);
}

System.out.println("pagenum: "+pageNumber);

BBSDao dao = BBSDao.getInstance();



// 총 글의 갯수
//System.out.println(len);
int len = dao.getAllBbs(optionpick, search);
System.out.println("length: "+len);

int bbsPage = len / 10;

if(len % 10 > 0 ) {	// 10(기준) 으로 나눈 나머지가 0 이상이면 다음 페이지도 만들어 준다
	bbsPage++;
}
System.out.println("bbsPage: "+bbsPage);

List<BbsDto> list = dao.searchBbs(optionpick, search, pageNumber);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:visited {
	color: black;
}
a:hover{
	color: olive;
	
}
</style>
</head>
<body>
<!-- 게시판 -->

<h4 align="right" style="background-color: #f0f0f0">환영합니다 <%=loginid%>님,</h4>

<h1><a href="bbslist.jsp" style="text-decoration: none;">BBS List</a></h1>
<div align="center">
<form action='searchbbs.jsp'>
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

<a href="bbswrite.jsp">글쓰기</a>

<a href="logout.jsp">로그아웃</a>

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




<div align="center">
<form action='searchbbs.jsp' id="frm" method='get'>

<select name="optionpick" id="optionpick"> 
	<option value="id">아이디</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
</select>
<input type="text" size="30" name="search" value="<%=search %>" id="searchBox">
<input type="hidden" name="pagenum">
<input type="button" id="sbtn" onclick="searchBtn()" value="검색">
</form>

<script type="text/javascript">

function searchBtn() {
	var stext = document.querySelector("input[name='search']").value;
	if( stext == "") {
		location.href="bbslist.jsp";
	}else{
		document.querySelector('#sbtn').type = "submit";
	}
}
</script>
</div>
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

<%!public String arrow (int depth){
	String rs = "<img src='./image/arrow.png' width='20px' height='20px'/> ";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	String ts = "";
	for(int i =0; i< depth; i++ ) {
		ts += nbsp;	// 앞에 부분의 여백
	}
	
	return depth==0? "": ts+rs ;
}%>

<script type="text/javascript">
// selector value를 지정하기
var sel = document.querySelector("#optionpick");

for(var i=0; i<3; i++ ){
	if(sel.options[i].value == '<%=optionpick%>' ){
		document.querySelector('#optionpick').options[i].selected = true;			
	}
}

function goPage( page ) {
	
	document.querySelector("input[name='pagenum']").value = page;
	document.querySelector('#frm').submit();
	
	
}
</script>

</body>
</html>