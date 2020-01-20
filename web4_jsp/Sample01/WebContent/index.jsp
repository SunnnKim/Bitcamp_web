<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- html 주석문 -->
	<%-- jsp 주석문 --%>
	
<%--

		JSP : Java Server Page
		
											(WAS)
		CLIENT ----- request ----- >    SERVER (web)   		< ------------- > SERVER (DB)
	(EX> local host:8080/sample)		java + html	
										 
										 server
											    +
									   container(html코드)
										servlet + jsp내장
										(get/post:보안문제)
		< ------ respond -------			해석
											
									   Spring Framework						MyBatis Framework
    
		
	* Servlet : Java 코드 안에 HTML코드 들어가 있음				
	* JSP : HTML안에 Java 코드 들어가있음
			HTML, javaScript, css, jquery, java.. 
			모두 사용가능 함
						
	
	* Jsp는 무조건 서버를 거쳐 해석 되어야 실행이 가능하다(서버코드와 클라이언트 코드가 공존하기 때문)
					
--%>
	 
	 
	 <h1>hello Jsp</h1>
	 
	 <%
	 	// java 영역
	 	// scriptlet = script + applet
	 	System.out.println("콘솔출력");
	 	out.println("<p>웹 출력</p>");

		/*
			내장 객체 : new 를 하지 않고 바로 사용할 수 있는 Object
			: request, response, session, out ... 등 
			
		*/	 
	 
	 
	 %>
	 <%
	 	// 내장객체는 scriptlet을 분리해도 사용가능하다
	 	out.println("out 객체 출력<br>");
	 %>
	 
	 <%
	 	// 변수 선언
	 	String str = "Hello JSP";
		System.out.println("str = " + str);
		out.println("str = " + str);
	 %>
		<br>
	 
	 <%-- 또는 html코드에서 이렇게 값 출력이 가능하다 --%>
		str = <%=str%>
	 
	 <br><br>
	 
	 <%-- for문 사용가능 --%>
	 <% 
		 for(int i=0; i<10; i++){
	 %>	
			 <p id="demo1">
			 	P Tag <%=i+1 %>
			 </p>		 
	 <%
	 	}
	 %>
	 
	 <% // 이것도 같은 방식으로 for문을 돌리는 것이지만 위의 방법을 더 많이 사용
		 for(int i=0; i<10; i++) {
		 	out.println(" <p id='demo2'> P Tag" + (i+1) + "</p>");	 
		 } 
	 %>
	 
	 <p id="demo"></p>	 
	 
	 
<script>
	// p태그에 접근하여 바꾸기 
	document.getElementById("demo").innerHTML = "Change p tag element";

</script>
</body>
</html>