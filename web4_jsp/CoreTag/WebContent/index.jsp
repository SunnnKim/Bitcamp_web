<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <!-- 
   EL: 표현식(값, 판별)
   
   Core: 제어문(for, if) -> EL tag와 같이 사용한다
   
   core태그는 jar파일과 링크가 필요함
 -->

   <%
      request.setAttribute("data", "JSTL입니다"); // set
   %>

   ${ data }
   <br>

   <%
      String cdata = "core JSTL입니다";
      request.setAttribute("data", cdata);
   %>
   <!-- 위와 같다 -->
   <!--  set  -->
   <c:set var="cdata" value="core JSTL입니다" />
   ${ cdata }
   <br>
   <br>

   <!-- out(내장객체_ -->
   <%
      out.println(cdata);
   %>

   <%
      session.setAttribute("sessionData", "저장된 데이터");
   %>
   <c:set var="sdate" value="${sessionData}"></c:set>
   <c:out value="${ sdate }" />
   <br>
   <br>

   <!--  if -->
   <%
      request.setAttribute("count", "10");
   %>
   <%
      String sCount = (String) request.getAttribute("count");
      int count = Integer.parseInt(sCount);
      if (count >= 10) {
   %>
   <p>
      count:<%=count%></p>
   <%
      }
   %>
   <!-- 위와 아래는 완전히 같다 -->
   <c:if test="${count >= 10}">
      <p>
         core count:
         <c:out value="${count}" />
      </p>
   </c:if>

   <br>
   <br>

   <%
      request.setAttribute("name", "홍길동");
   %>

   <c:if test="${ name eq '홍길동' }">
      <p>제이름은 홍길동이 맞습니다</p>
   </c:if>
<br>
<br>

   <%
      request.setAttribute("name", "일지매");
   %>

   <c:if test="${ name eq '일지매' }" var="flg"/>
   
	   <c:if test="${flg }">
	      <p>이름은 일지매입니다</p>
   </c:if>
   
   <!-- for -->
   <%
   for(int i = 0; i< 10; i++){
      %>
      <%=i %>
      <%
   }
   %>
   <br>
   <c:forEach begin="0" end="9" step="1" varStatus="i">
      <c:out value="${i.index }"></c:out>
   </c:forEach>
   
   <br><br>
   
  <%
	List<MemberDto> list = new ArrayList<>();
	MemberDto mem = new MemberDto();
	mem.setMsg("hi");
	list.add(mem);
	
	mem = new MemberDto();
	mem.setMsg("hello");
	list.add(mem);
	
	mem = new MemberDto();
	mem.setMsg("what's up");
	list.add(mem);
	
	request.setAttribute("list", list);
  		
  %>
  <%--
  	for(int i=0; i < list.size(); i++ ){
  		MemberDto m = list.get(i);
  	}
  	for( MemberDto m : list ){
 	}
  --%>
  
  <!--  -->
  <c:forEach begin="0" end="2" var="m" items="${list}" varStatus="i">
  	<p>index: <c:out value="${i.index }"/></p>
  	<p>data: <c:out value="${ m.msg }"/></p>
  </c:forEach>
  
  <!-- Map -->
  <%
 		Map<String, String> map = new HashMap<>();
  		map.put("apple", "사과");
  		map.put("pear", "배");
  		map.put("banana", "바나나");
		
  		request.setAttribute("map", map);

  %>
  <c:forEach var="obj" items="${map }">
  	key: <c:out value="${obj.key }"></c:out>	<!-- key 값을 가져옴 -->
  	value: <c:out value="${obj.value }"></c:out>	<!-- value 값을 가져옴 -->
  
  </c:forEach>

</body>
</html>
















