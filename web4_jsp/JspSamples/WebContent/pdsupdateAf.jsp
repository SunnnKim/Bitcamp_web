<%@page import="dao.PdsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!

//기능함수
public String processUploadFile(FileItem fileItem, String dir ) throws IOException{
	
	String filename = fileItem.getName();	// --> 경로 + 파일명으로 들어옴 ( 1.서버(톰캣) 경로  2.클라이언트 경로)
	long sizeInBytes = fileItem.getSize();	// 파일의 크기 구하기
	if(sizeInBytes > 0 ) {	// 클라이언트의 경로일 때 예시 : d:/tmp/abc.txt 또는 d:\\tmp\\abc.txt
		// 정상적으로 파일이 업로드 되었을 때
		
		int idx = filename.lastIndexOf("\\");	// \으로 입력되있을 때
		if(idx == -1 ){
			idx = filename.lastIndexOf("/");	// /로 입력되었을 때
		}
		
		// 경로 빼고 파일명만 가져오기
		filename = filename.substring( idx+1 );
		
		// 업로드하는 디렉토리에 업로드 한 파일을 기입함
		File uploadfile = new File(dir, filename);
		
		try{
			fileItem.write(uploadfile);	// 실제 업로드 부분
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	return filename;	// return 값은 확인용
	
}
// 파일 바꿨는지 확인
public boolean checkFileUpdate(String newFile){
	
	if(!newFile.equals("")){
		return true;	// 바뀜
	}
		return false;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String fupload = application.getRealPath("/upload");	
// 새파일 업데이트 할 경로 

System.out.println("업로드 폴더: " + fupload);
String yourTempDir = fupload;


int yourMaxRequestSize = 100 * 1024* 1024;	// 최대 업로드 가능 사이즈 1 MB
int yourMaxMemorySize = 100 * 1024;			// 최대 메모리 사이즈 1 KB

// form field의 데이터를 저장할 변수
String title = "";
String content = "";

// file name
String filename = "";


//multipart 가 맞는지 확인
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if(isMultipart){
	
	// file item 생성하기
	DiskFileItemFactory factory = new DiskFileItemFactory();	

	// 용량 설정
	factory.setSizeThreshold(yourMaxMemorySize);	// max memorysize 설정
	
	// 저장소 설정 ( 저장 파일 생성 )
	factory.setRepository(new File(yourTempDir));
	
	// 업로드 설정
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(yourMaxRequestSize);	// 순간 전송크기를 설정
	
	// list 저장 -> id, title, content, file 등을 저장
	List<FileItem> items = upload.parseRequest(request);	// 전송되어온 파일을 뽑아옴(parsing)
	
	// list에서 get 아닌 iterator로 꺼낸다
	Iterator<FileItem> it = items.iterator();
	
	

	// 데이터 구분하기 (form과 file 데이터 구분하기)
	while(it.hasNext()){
		
		FileItem item = it.next();
		if(item.isFormField() ){	// formfield 를 찾아서 구분해준다.
			// title, content 등 form field에 해당하는 String만 넘어온다
			if(item.getFieldName().equals("title")){
				title = item.getString("utf-8");
			}else if(item.getFieldName().equals("content")){
				content = item.getString("utf-8");
			}
		}
		else{	// fileload
			// file 일 때
			if(item.getFieldName().equals("fileload")){	// fileload로 보냄
				filename = processUploadFile(item, fupload);
				// item을 만들어서 fuload라는 경로에 넣어두어라
			}
		}
	}
}

else{
	System.out.println("multipart가 아님");
}

%>


</body>
</html>