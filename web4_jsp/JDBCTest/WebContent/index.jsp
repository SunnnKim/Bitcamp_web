<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>HR Tables</h1>
<p>모든 테이블의 목록을 출력한다</p> 

<%-- DB의  --%>

<%!	
	// 선언부
	public boolean has$(String msg){
		// $ 가 포함되어 있는 테이블은 링크가 되지 않도록 하기 위한 함수(검색)
		// $가 붙어있는 것은 잔여 데이터?
		return msg.contains("$");
	}

%>

<%
	// 소스부
	// JDBC 기본 설정
	Class.forName("oracle.jdbc.driver.OracleDriver");	// db 드라이버 연결
	String url = "jdbc:oracle:thin:@192.168.2.31:1521:xe";	// DB Development에 등록된 주소
	String user = "hr";
	String password = "hr";
	// JDBC
	Connection conn = DriverManager.getConnection(url,user, password); 

	String sql = "SELECT * FROM TAB";
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	ResultSet rs = psmt.executeQuery();
	ResultSetMetaData rsmd = rs.getMetaData();	// = column 정보가 들어옴 
	int count = rsmd.getColumnCount();			// = colum 수
	
	
	
%>
<table border="1">
<tr>
	<%
		for(int i=1; i<count+1; i++){ %>
			<th><%=rsmd.getColumnName(i) %></th>
		
		<% } %>
		
</tr>
<%
	while( rs.next() ){
	%>
		<tr>
			<% 
				for(int i=1; i<count + 1; i++) { 
					String cols = rs.getString(i);
					if( i == 1 && !has$(cols)){
							// $가 없는 1번째 열이면 실제 테이블이기 때문에 데이터를 볼 수 있도록 링크를 걸어준다 
						%>
							<td>
								<a href="table.jsp?tname=<%=cols %>"><%=cols %></a>
							</td>
						<%
					}else{
							// 1번째 열이 아니거나 $가 붙은 열데이터는 테이블이 아니기때문에 그냥 이름만 넣어줌
						%>
							<td>
								<%=rs.getString(i) %>
							</td>						
						<%
					}
				}
			%>
		</tr>
	
	<%
	} 
%>

</table>

<%
	// 해방시키기
	if( rs != null ) rs.close();
	if(psmt != null ) psmt.close();
	if(conn != null ) conn.close();

%>

</body>
</html>