package c;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.stream.FileImageInputStream;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownload extends HttpServlet {
	
	ServletConfig mConfig = null;
	static final int BUFFER_SIZE = 8192;	// 8 kbyte
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO 업로드 폴더 경로를 취득하기 위해서 Config에 접근
		super.init(config);
		mConfig = config;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("FileDownLoader doGet");
		
		String filename = req.getParameter("filename");
		String sseq = req.getParameter("seq");
		
		// down load 회수 증가(DB)
		
		BufferedOutputStream out = new BufferedOutputStream(resp.getOutputStream());
		
		String filePath = "";
		
		// tomcat(Server)
		filePath = mConfig.getServletContext().getRealPath("/upload");
		
		// 폴더(Client)
	//	filePath = "d:\\tmp";
		
		filePath = filePath + "\\" + filename;
		System.out.println("다운로드:" + filePath);
		
		File f = new File(filePath);
		
		if(f.exists() && f.canRead()) {
		//	System.out.println("파일이 맞고 있습니다");
			
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
			resp.setHeader("Content-Transfer-Encoding", "binary;");
			resp.setHeader("Content-Length", "" + f.length());
			resp.setHeader("Pragma", "no-cache;"); 
			resp.setHeader("Expires", "-1;");
			
			// 파일을 생성, 기입
			BufferedInputStream fileInput = new BufferedInputStream(
												new FileInputStream(f));
			byte buffer[] = new byte[BUFFER_SIZE];
			
			int read = 0;
			while( (read = fileInput.read(buffer) ) != -1) {
				out.write(buffer, 0, read);		// 실제 다운로드				
			}
			fileInput.close();
			out.flush();
		}		
	}
	
}

/*
  	FileDownLoader 다운로드 수
  
	PdsDeatil	조회수
	
	PdsDelete	DB에서만 삭제
	
	PdsUpdate 
		File이 null이면 title, content
				-> File 생성

*/






