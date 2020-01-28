<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id= request.getParameter("id");
	System.out.println(id);
	
	boolean b = MemberDao.getInstance().checkid(id);
	//out.println(b);
	response.getWriter().write(b+"");

%>