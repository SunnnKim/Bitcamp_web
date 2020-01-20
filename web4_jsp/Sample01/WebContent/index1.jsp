<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- scriptlet의 영역--%>
<%!
	// <%! : 선언부분의 영역 - 변수선언 (global= 전역변수), 함수선언, 클래스 선언 등
	//	 	  딱 한번만 실행되는 영역, 잘 사용하지는 않음
	
	
	int gl_var = 0;
	
	// 함수선언
	public void func(){
		System.out.println("func() 호출");
	}
%>

<%	
	// <% : 코드부 (일반코드 작성 및 실행)
	gl_var++;	// 전역변수라 실행할 수록 값이 오름

	int var = 0;	// 지역변수 
	var++;
	out.println("gl_var = " + gl_var );
	out.println("var = " + var );
	
	// 함수호출
	func();	// 콘솔에 나옴	
%>

<%-- <%= : value 부(값을 취득) --%>
<%=gl_var  %>

</body>
</html>