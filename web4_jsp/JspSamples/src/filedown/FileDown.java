package filedown;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PdsDao;

public class FileDown extends HttpServlet {
	
	// realPath를 얻어오기 위해서는 config가 필요
	ServletConfig mConfig = null;
	
	// 다운로드 버퍼 용량이 필요
	static final int BUFFER_SIZE = 8192; // 8KB (임시저장공간의 크기)
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// 업로드 폴더 경로를 취득하기 위해서 config 에 접근해야 함
		
		this.mConfig = config;
		
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//location.href 로 던지기 때문에 doGet으로 옴
		
		System.out.println("FileDown doGet");	
		
		String filename = req.getParameter("filename");
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		
		// download 횟수 증가하는 함수 (DB)
		PdsDao.getInstance().downCount(seq);
		
		
		// outputstream ( 날린 데이터를 받아주는 부분 ) 
		BufferedOutputStream out = new BufferedOutputStream(resp.getOutputStream());
		
		String filepath = "";
		
		// 파일경로 2가지 방법
		// 1. tomcat (Server)
		filepath = mConfig.getServletContext().getRealPath("/upload");	// 원래 저장한 경로를 가져오기 (realPath는 파일 올렸던 경로와 같아야함)
		
		// 2. 폴더 ( Client ) 
//		filepath = "d:\\tmp";
		
		filepath += "\\" +filename;
		System.out.println("다운로드 : " + filepath );
		
		File f = new File(filepath);	// 파일 포인터 주기
		
		// 파일이 있고 읽을 수 있는지 확인하기
		if(f.exists() && f.canRead() ) {	
			// System.out.println("file exists and file can read");
			
			// 파일 다운로드 하는 코드 (2진 파일)
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
			resp.setHeader("Content-Transfer-Encoding", "binary;");
			resp.setHeader("Content-Length", "" + f.length());
			resp.setHeader("Pragma", "no-cache;"); 
			resp.setHeader("Expires", "-1;");
			
			//파일을 생성, 기입 
			BufferedInputStream fileInput = new BufferedInputStream(new FileInputStream(f));
			
			
			byte buffer[] = new byte[BUFFER_SIZE];
			
			int read = 0 ; 
			while ( (read = fileInput.read(buffer))!= -1 ) {
				out.write(buffer, 0, read );	// 실제 파일에 바이트로 적는 부분
			}
			
			fileInput.close();
			out.flush();
			
			
			
		}
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
	
}
