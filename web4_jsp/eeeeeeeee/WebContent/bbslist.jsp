<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
// 댓글의 여백과 이미지를 추가하는 함수
public String arrow(int depth){
	String rs = "<img src='./image/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	String ts = "";
	for(int i = 0;i < depth; i++){
		ts += nbsp;
	}	
	return depth==0?"":ts + rs;
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<%
// 검색
String searchWord = request.getParameter("searchWord");
String choice = request.getParameter("choice");

if(choice == null || choice.equals("")){
	choice = "sel";
}

// 검색어를 지정하지 않고 choice가 넘어 왔을 때
if(choice.equals("sel")){
	searchWord = "";
}
if(searchWord == null){
	searchWord = "";
	choice = "sel";
}
%>

<%
	Object ologin = session.getAttribute("login");
				// request.getSession().getAttribute(name)
	MemberDto mem = null;
	if(ologin == null){				
		%>
		<script type="text/javascript">
		alert("로그인 해 주십시오");
		location.href = "login.jsp";
		</script>
		<%			
	}
	mem = (MemberDto)ologin;
%>	
	
<%
// paging
String spageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(spageNumber != null && !spageNumber.equals("")){
	pageNumber = Integer.parseInt(spageNumber);
}

	BbsDao dao = BbsDao.getInstance();	
//	List<BbsDto> list = dao.getBbsList();
//	List<BbsDto> list = dao.getBbsList(choice, searchWord);
	List<BbsDto> list = dao.getBbsPagingList(choice, searchWord, pageNumber);
	
//	request.setAttribute("list", list);

int len = dao.getAllBbs();
System.out.println("총 글의 갯수:" + len);

int bbsPage = len / 10;	// 예: 22개의 글 -> 3페이지
if(len % 10 > 0){
	bbsPage = bbsPage + 1;
}

%>

<h4 align="right" style="background-color: #f0f0f0">
	환영합니다 <%=mem.getId() %>님
</h4>

<h1>게시판</h1>

<div align="center">

<table border="1">
<col width="70"><col width="600"><col width="150">

<tr>
	<th>번호</th><th>제목</th><th>작성자</th>
</tr>
<%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="3">작성된 글이 없습니다</td>
	</tr>
	<%
}else{
	
	for(int i = 0;i < list.size(); i++){
		BbsDto bbs = list.get(i);		
	%>
	<tr>
		<th><%=i + 1 %></th>
		<%-- 
		<td>
			<%=arrow(bbs.getDepth()) %>
			<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
				<%=bbs.getTitle() %>	
			</a>
		</td>
		 --%>
		<td>
			<%
			if(bbs.getDel() == 0){
				%>
				<%=arrow( bbs.getDepth() ) %>			
				<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
					<%=bbs.getTitle() %>
				</a>	
				<%
			}else{
				%>		
				<font color="#ff0000">이 글은 작성자에 의해서 삭제되었습니다</font> 
				<%
			}
			%>
		</td> 
		<td align="center"><%=bbs.getId() %></td>
	</tr>
	<%
	}
}
%>
</table>

<%
for(int i = 0;i < bbsPage; i++){		// [1] 2 [3]
	if(pageNumber == i){	// 현재 페이지		
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
		</span>&nbsp;
		<%
	}else{	// 그 외의 페이지
		%>
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: #000; font-weight: bold;">
			[<%=i + 1 %>]
		</a>&nbsp;
		<%		
	}
}
%>
<br><br>

<a href="bbswrite.jsp">글쓰기</a>
</div>

<br>

<div align="center">

<select id="choice">
	<option value="sel">선택</option>
	<option value="title">제목</option>
	<option value="writer">작성자</option>
	<option value="content">내용</option>
</select>

<input type="text" id="search" value="">

<button onclick="searchBbs()">검색</button>

</div>

<br><br><br>

<script type="text/javascript">
function searchBbs() {
	var choice = document.getElementById("choice").value;
	var word = $("#search").val();
//	alert(choice);
//	alert(word);

	if(word == ""){
		document.getElementById("choice").value = 'sel';
	}
	
	location.href = "bbslist.jsp?searchWord=" + word + "&choice=" + choice;
	
}

function goPage( pageNum ) {
//	alert("pageNum:" + pageNum);
	location.href = "bbslist.jsp?pageNumber=" + pageNum;
}

</script>


</body>
</html>





