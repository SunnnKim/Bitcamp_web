<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//String filepath = application.getRealPath("/upload/");

	File f  = new File("/Users/sunjukim/Bitcamp_web/web4_jsp/ImageUpload/WebContent/upload/");
	//File f  = new File("/Users/sunjukim/Desktop/tmp_pic");
	String fs[] = f.list();
//	String name[]=String[fs.length];
	if(fs.length>0){
		System.out.println("파일 있음 ");
		
		for(int i=0;i<fs.length; i++){
			if(fs[i].contains(".jpg")||fs[i].contains(".jpeg")
					|| fs[i].contains(".png")||fs[i].contains(".gif"))
			System.out.println( f.getName() );
			System.out.println(  fs[i] );
		}
			//name[i]
		
	}
			//System.out.println(filepath );
	
%>
<img src="<%= f.getName()+'/'+fs[0]%>">

</body>
</html>