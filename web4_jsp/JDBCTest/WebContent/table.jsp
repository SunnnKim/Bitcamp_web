<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	// 넘어오는 파라미터 확인하기
	String tname = request.getParameter("tname");
	System.out.println(tname);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>HR table</h1>

<p>지정 테이블의 정보를 출력한다</p>


<%
	// 소스부
	// JDBC 기본 설정
	Class.forName("oracle.jdbc.driver.OracleDriver");	// db 드라이버 연결
	String url = "jdbc:oracle:thin:@192.168.2.31:1521:xe";	// DB Development에 등록된 주소
	String user = "hr";
	String password = "hr";
	// JDBC
	Connection conn = DriverManager.getConnection(url,user, password); 

	String sql = "SELECT * FROM " + tname;
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	ResultSet rs = psmt.executeQuery();
	ResultSetMetaData rsmd = rs.getMetaData();	// = column 정보가 들어옴 
	int count = rsmd.getColumnCount();			// = colum 수
	
%>

<table border="1">
	<tr>
	<%
		for(int i=1; i<count +1; i++ ){
		%>
			<td><%= rsmd.getColumnName(i) %></td>		
		<% 
		}
	%>
	</tr>
<%
	while ( rs. next() ) {
		%>
		<tr>
			<%
				for(int i=1; i<count+1; i++ ){
				%>
					<td><%= rs.getString(i) %></td>
				<% 
				}
			
			
			%>
		</tr>
		
		
		<%
	}


%>



</table>
</body>
</html>