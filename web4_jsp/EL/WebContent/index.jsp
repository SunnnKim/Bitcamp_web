<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

<!-- EL  -->
<%-- 
<%! // 선언부 : class, function, variable(global)%>
<% // 코드부 %>
<%= //value부 %>

---------
EL tag : front end에서 자바 코드를 사용하지 않기 위해 사용하는 태그 
Core tag : 제어문 담당 (링크 걸어야 함- jar파일필요)
---------
: jsp 파일에서 java형식의 코드를 대용할 수 있는 태그
                                                                                                                                                 
* jsp 태그 

JSTL( Java server page Standard Tag Library ) : 표준 액션태그로 처리하기 힘든 부분을 담당


* EL : Expression Language
		표현			언어
	=>  

--%>

<%
	String str = "hello";
	request.setAttribute("_str", str);	// request scope에 저장이 됨
%>

<%
	String s = (String) request.getAttribute("_str");

%>
<%
	out.println("s = " + s);
%>

<br>
s = <%= s %>

<br><br>
<!-- el태그 사용하기 : setAttribute에서 작성한 문자열(이름)을 가져온다 -->
s = ${ _str }	
<br>

<%='값' %>
<br>
${ '값' }
<br>


<%= 2+3 %>
<br>
${ 2+3  }
<br>
<!-- 삼항연산자도 가능  -->
${ 3>2? 100 : 200 }
<br>
<%

	request.setAttribute("data", "안녕하세요");
	/* el태그는 반드시 setAttribute를 해주어야 사용가능 */
	
%>
${ data }

<br><br>
Object가 동적할당이 되었는지 확인하기
<br>

data = ${ empty data }	<!-- T/F로 확인받기  없음true, 있음 false -->
<br>
data = ${ not empty data }	<!-- 있음(true) 없음(false) -->
<br><br>
<!-- 판별식 : true, false -->
1 < 9 : ${ 1< 9 }
<br>
1 > 9 : ${ 1 > 9 }

<!-- 연산식 : 연산한 값이 나옴 -->
<br>
2 + 3 : ${ 2+3 }	
<%
	Integer a, b;
	a = 10;
	b = 3;
	
	// 
	request.setAttribute("a", a);
	request.setAttribute("b", b);
	
	Boolean c;
	c = false;
	
	request.setAttribute("c", c);
	
	
%>

<pre>
* 판정하기 
a: ${ a }
b: ${ b }
c: ${ c }

a+b: ${ a+b }

* eq, == : 같을 때 
eq: ${a eq b } 
 --> false 
eq: ${a == b } 
 == 와 eq는 결과 동일 

* ne, != : 같지 않을 때 
ne : ${a ne b }
ne : ${a != b }

* gt : > 
gt: ${ a gt b }
gt: ${ a > b }

* lt : < 
lt: ${ a lt b }
gt: ${ a < b }

* le : <=
le: ${ a le b } <!-- <= -->
* ge : >=
ge: ${ a ge b } <!-- >= -->


* 나누기  div
div: ${ a div b }
* 나머지 mod
mod: ${ a mod b } <!-- 나머지 -->

* ! : not
c: ${ !c }

* &&, || (boolean반환)
${ a==10 && !c }


</pre>

<%
	MemberDto mem = new MemberDto();
	mem.setMsg("hello EL");
	
	request.setAttribute("mem", mem);
	
%>
<%= mem.getMsg() %>
<br>
<!-- 위의 코드와 똑같은 결과임, MemberDto의 변수 msg의 getter가 자동 호출되는 방식   -->
${ mem.msg }

<!-- 배열 표현방법 -->
<%

String array[] = { "hello", "world" };

request.setAttribute("array", array);


%>

<%=array[0] %>
<br>
${ array[0] } 
${ array[1] }

<br>

<%
	List<String> list = new ArrayList<>();
	list.add("world");
	list.add("el");
	
	request.setAttribute("list", list);
%>

<%= list.get(0) %>
<!-- list도 무조건 배열로 사용한다 -->
${ list[0] }

<br>
<br>

<%
	// 객체 리스트를 el로 출력해보기
	
	// 리스트 데이터 일단 만들기
	List<MemberDto> memlist = new ArrayList<>();
	MemberDto m = new MemberDto();
	m.setMsg("첫번째 메세지");
	memlist.add(m);
	m = new MemberDto();
	m.setMsg("두번째 메세지");
	memlist.add(m);
	
	request.setAttribute("memlist", memlist);

%>

<%= memlist.get(1).getMsg() %>
<!-- 1번째 인텍스의 msg의 getter접근 -->
${ memlist[1].msg }

<br><br>

<%
	HashMap<String, String> map = new HashMap<>();
	map.put("apple","사과");
	map.put("grape","포도");
	
	request.setAttribute("map", map);
		
	
%>
<%= map.get("apple") %>
<!-- map에서 접근하기 : map변수이름.key이름 -->
${ map.apple }
<!-- 또는 배열형태로 받아오기, 인덱스에 key값 적으면 되는데 문자열로 적을 것-->
${ map["apple"] }











</body>
</html>